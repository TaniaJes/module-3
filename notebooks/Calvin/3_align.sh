#!/bin/bash
#SBATCH  --partition=cpu_short
#SBATCH  --nodes=1
#SBATCH  --tasks-per-node=1
#SBATCH  --cpus-per-task=16
#SBATCH  --time=5-00:00:00
#SBATCH  --mem=50GB
#SBATCH  --output=foo.txt
#SBATCH  --mail-type=END
#SBATCH  --mail-user=calvin.zhao@nyumc.org


# SRR7049609_1_val_1.fq SRR7049609_2_val_2.fq
# SRR7049610_1_val_1.fq SRR7049610_2_val_2.fq
# SRR7049611_1_val_1.fq SRR7049611_2_val_2.fq
# SRR7049612_1_val_1.fq SRR7049612_2_val_2.fq
# SRR7049615_1_val_1.fq SRR7049615_2_val_2.fq
# SRR7049616_1_val_1.fq SRR7049616_2_val_2.fq

module load bowtie2/2.4.1
module load igenome

bowtie2 -D 5 --fr --threads 16 -x  $IGENOMES_ROOT/Homo_sapiens/UCSC/hg38/Sequence/Bowtie2Index/genome -1 /gpfs/scratch/ccz221/trimmed/test_1_val_1.fq -2 /gpfs/scratch/ccz221/trimmed/test_2_val_2.fq -S /gpfs/scratch/ccz221/aligned/test.sam
bowtie2 -D 5 --fr --threads 16 -x  $IGENOMES_ROOT/Homo_sapiens/UCSC/hg38/Sequence/Bowtie2Index/genome -1 /gpfs/scratch/ccz221/trimmed/SRR7049609_1_val_1.fq -2 /gpfs/scratch/ccz221/trimmed/SRR7049609_2_val_2.fq -S /gpfs/scratch/ccz221/aligned/SRR7049609.sam
bowtie2 -D 5 --fr --threads 16 -x  $IGENOMES_ROOT/Homo_sapiens/UCSC/hg38/Sequence/Bowtie2Index/genome -1 /gpfs/scratch/ccz221/trimmed/SRR7049610_1_val_1.fq -2 /gpfs/scratch/ccz221/trimmed/SRR7049610_2_val_2.fq -S /gpfs/scratch/ccz221/aligned/SRR7049610.sam
bowtie2 -D 5 --fr --threads 16 -x  $IGENOMES_ROOT/Homo_sapiens/UCSC/hg38/Sequence/Bowtie2Index/genome -1 /gpfs/scratch/ccz221/trimmed/SRR7049611_1_val_1.fq -2 /gpfs/scratch/ccz221/trimmed/SRR7049611_2_val_2.fq -S /gpfs/scratch/ccz221/aligned/SRR7049611.sam
bowtie2 -D 5 --fr --threads 16 -x  $IGENOMES_ROOT/Homo_sapiens/UCSC/hg38/Sequence/Bowtie2Index/genome -1 /gpfs/scratch/ccz221/trimmed/SRR7049612_1_val_1.fq -2 /gpfs/scratch/ccz221/trimmed/SRR7049612_2_val_2.fq -S /gpfs/scratch/ccz221/aligned/SRR7049612.sam
bowtie2 -D 5 --fr --threads 16 -x  $IGENOMES_ROOT/Homo_sapiens/UCSC/hg38/Sequence/Bowtie2Index/genome -1 /gpfs/scratch/ccz221/trimmed/SRR7049615_1_val_1.fq -2 /gpfs/scratch/ccz221/trimmed/SRR7049615_2_val_2.fq -S /gpfs/scratch/ccz221/aligned/SRR7049615.sam
bowtie2 -D 5 --fr --threads 16 -x  $IGENOMES_ROOT/Homo_sapiens/UCSC/hg38/Sequence/Bowtie2Index/genome -1 /gpfs/scratch/ccz221/trimmed/SRR7049616_1_val_1.fq -2 /gpfs/scratch/ccz221/trimmed/SRR7049616_2_val_2.fq -S /gpfs/scratch/ccz221/aligned/SRR7049616.sam