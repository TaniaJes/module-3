#!/bin/bash
#SBATCH  --partition=cpu_short
#SBATCH  --nodes=1
#SBATCH  --tasks-per-node=1
#SBATCH  --cpus-per-task=2
#SBATCH  --time=5-00:00:00
#SBATCH  --mem=50GB
#SBATCH  --output=foo.txt
#SBATCH  --mail-type=END
#SBATCH  --mail-user=calvin.zhao@nyumc.org

module load bedtools/2.26.0

for i in test SRR7049609 SRR7049610 SRR7049611 SRR7049612 SRR7049615 SRR7049616
do
	### BEDGRAPH FILES
	genomeCoverageBed -ibam /gpfs/scratch/ccz221/processed/merged/$i.fwd.bam -bg -split > /gpfs/scratch/ccz221/processed/BED/$i.fwd.bedgraph
	genomeCoverageBed -ibam /gpfs/scratch/ccz221/processed/merged/$i.rev.bam -bg -split > /gpfs/scratch/ccz221/processed/BED/$i.rev.bedgraph
	genomeCoverageBed -ibam /gpfs/scratch/ccz221/processed/$i.sorted.bam -bg -split > /gpfs/scratch/ccz221/processed/BED/$i.sorted.bedgraph

	### BED12 FILES
	bamToBed -bed12 -i /gpfs/scratch/ccz221/processed/merged/$i.fwd.bam > /gpfs/scratch/ccz221/processed/BED/$i.fwd.bed
	bamToBed -bed12 -i /gpfs/scratch/ccz221/processed/merged/$i.rev.bam > /gpfs/scratch/ccz221/processed/BED/$i.rev.bed
	bamToBed -bed12 -i /gpfs/scratch/ccz221/processed/$i.sorted.bam > /gpfs/scratch/ccz221/processed/BED/$i.sorted.bed
done