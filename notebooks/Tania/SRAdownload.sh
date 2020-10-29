#!/bin/bash 
#SBATCH --job-name=Data_download # Job name 
#SBATCH --mail-type=ALL # Mail events (NONE, BEGIN, END, FAIL, ALL) 
#SBATCH --mail-user=tania.gonzalez-robles@nyulangone.org # Where to send mail 
#SBATCH --ntasks=6 # Run on a single CPU 
#SBATCH --mem=128gb # Job memory request 
#SBATCH --time=08:00:00 # Time limit hrs:min:sec 
#SBATCH --output=/gpfs/home/tgr248/jobreports/slurm_%A_%a.log # Standard output and error log 
#SBATCH -p cpu_short # Specifies location to submit job
#SBATCH --array=609-612,615,616


# LOAD MODULES
module load sratoolkit/2.9.1
module load fastqc/0.11.7
module load python/cpu/2.7.15-ES # contains multiqc command
module load trimgalore/0.5.0
module load igenome/1.0         # to access shared genome reference files within BP
module load bowtie2/2.4.1
module load samtools/1.10
module load bedtools/2.26.0


# ENVIRONMENT SETUP
mkdir -p /gpfs/scratch/tgr248/bioinformatics # -p flag will create a folder if necessary
cd /gpfs/scratch/tgr248/bioinformatics
mkdir -p ./module-3
mkdir -p ./module-3/data
cd ./module-3/data


DIRECTORY=/gpfs/scratch/tgr248/bioinformatics/module-3/data
REFERENCE="/gpfs/share/apps/iGenomes/Homo_sapiens/UCSC/hg38/Sequence/Bowtie2Index/genome"
DATA_ID="7049" # beginning of SRR ID, without the array section


# JOB DESCRIPTION
hostname
date
pwd
echo "SRR$DATA_ID$SLURM_ARRAY_TASK_ID" # to track which is current file 


# DATA DOWNLOAD
fastq-dump --split-files SRR${DATA_ID}${SLURM_ARRAY_TASK_ID} --gzip -O $DIRECTORY --origfmt 

multiqc .
 
# QC ANALYSIS
fastqc -o $DIRECTORY $DIRECTORY/SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_1.fastq.gz \
		     $DIRECTORY/SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_2.fastq.gz


# remove temporary directory that is utilised by fastq-dump
#rm -vr ~/ncbi 

# TRIMGALORE
mkdir -p ./trimGalore
cd ./trimGalore

trim_galore --paired -q 30 --length 30 $DIRECTORY/SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_1.fastq.gz $DIRECTORY/SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_2.fastq.gz --fastqc

multiqc .


# BOWTIE2 ALIGNMENT OF TRIMMED SEQUENCES
bowtie2 --very-fast --fr -x $REFERENCE \
	-1 ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_1_val_1.fq.gz \
	-2 ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_2_val_2.fq.gz \
	-S ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_trimmed_bt2_mapped.sam
# flags:
	# --fr	for/rev strandness
	# --very-fast	


# SAMTOOLS PROCESSING
mkdir -p ../samtools
cd ../samtools

samtools view -bSo ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_trimmed_bt2_mapped.bam ../trimGalore/SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_trimmed_bt2_mapped.sam
samtools sort -o ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_trimmed_bt2_mapped.sorted.bam ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_trimmed_bt2_mapped.bam
samtools index ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_trimmed_bt2_mapped.sorted.bam


# STRAND SEPARATION
samtools view -b -f 83 ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_trimmed_bt2_mapped.sorted.bam > ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_fwd1.bam
samtools view -b -f 163 ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_trimmed_bt2_mapped.sorted.bam > ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_fwd2.bam
samtools index ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_fwd1.bam
samtools index ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_fwd2.bam
samtools merge -f ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_fwd.bam ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_fwd1.bam ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_fwd2.bam
samtools index ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_fwd.bam

samtools view -b -f 99 ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_trimmed_bt2_mapped.sorted.bam > ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_rev1.bam
samtools view -b -f 147 ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_trimmed_bt2_mapped.sorted.bam > ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_rev2.bam
samtools index ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_rev1.bam
samtools index ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_rev2.bam
samtools merge -f ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_rev.bam ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_rev1.bam ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_rev2.bam
samtools index ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_rev.bam 


# BEDGRAPH FILES 
samtools view -b ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_fwd.bam | genomeCoverageBed -ibam stdin -bg -split > ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_bt2.fwd.bedgraph
samtools view -b ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_rev.bam | genomeCoverageBed -ibam stdin -bg -split > ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_bt2.rev.bedgraph


# BED12 FILES
bamToBed -bed12 -i ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_fwd.bam > ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_fwd.bed
bamToBed -bed12 -i ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_rev.bam > ./SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_rev.bed


###END OF CODE###


################
