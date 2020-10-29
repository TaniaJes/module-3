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

module load samtools/1.9

for i in test SRR7049609 SRR7049610 SRR7049611 SRR7049612 SRR7049615 SRR7049616
do
	##FWD##
	samtools view -b        -@ 16 /gpfs/scratch/ccz221/aligned/$i.sam > /gpfs/scratch/ccz221/processed/$i.bam
	samtools sort           -@ 16 /gpfs/scratch/ccz221/processed/$i.bam > /gpfs/scratch/ccz221/processed/$i.sorted.bam
	samtools index          -@ 16 /gpfs/scratch/ccz221/processed/$i.sorted.bam
	samtools view -b -f 83  -@ 16 /gpfs/scratch/ccz221/processed/$i.sorted.bam > /gpfs/scratch/ccz221/processed/$i.fwd1.bam
	samtools view -b -f 163 -@ 16 /gpfs/scratch/ccz221/processed/$i.sorted.bam > /gpfs/scratch/ccz221/processed/$i.fwd2.bam
	samtools index          -@ 16 /gpfs/scratch/ccz221/processed/$i.fwd1.bam
	samtools index          -@ 16 /gpfs/scratch/ccz221/processed/$i.fwd2.bam
	samtools merge -f       -@ 16 /gpfs/scratch/ccz221/processed/merged/$i.fwd.bam /gpfs/scratch/ccz221/processed/$i.fwd1.bam /gpfs/scratch/ccz221/processed/$i.fwd2.bam
	samtools index          -@ 16 /gpfs/scratch/ccz221/processed/merged/$i.fwd.bam

	##REV##
	samtools view -b -f 99  -@ 16 /gpfs/scratch/ccz221/processed/$i.sorted.bam > /gpfs/scratch/ccz221/processed/$i.rev1.bam
	samtools view -b -f 147 -@ 16 /gpfs/scratch/ccz221/processed/$i.sorted.bam > /gpfs/scratch/ccz221/processed/$i.rev2.bam
	samtools index          -@ 16 /gpfs/scratch/ccz221/processed/$i.rev1.bam
	samtools index          -@ 16 /gpfs/scratch/ccz221/processed/$i.rev2.bam
	samtools merge -f       -@ 16 /gpfs/scratch/ccz221/processed/merged/$i.rev.bam /gpfs/scratch/ccz221/processed/$i.rev1.bam /gpfs/scratch/ccz221/processed/$i.rev2.bam
	samtools index          -@ 16 /gpfs/scratch/ccz221/processed/merged/$i.rev.bam
done