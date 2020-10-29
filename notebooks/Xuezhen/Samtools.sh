#!/bin/bash
#SBATCH --job-name=samtools
#SBATCH --mail-type=ALL 
#SBATCH --mail-user=xc2121@nyu.edu 
#SBATCH --ntasks=1  
#SBATCH --mem=100gb 
#SBATCH --output=./slurm_%A_%a.log
#SBATCH -p cpu_medium
#SBATCH --cpus-per-task=16
#SBATCH --time=24:00:00

module load samtools/1.9

samtools view -bS -o /gpfs/scratch/chenx26/Assignment2/alignment/mapping609.bam /gpfs/scratch/chenx26/Assignment2/alignment/mapping609.sam
samtools sort -o /gpfs/scratch/chenx26/Assignment2/alignment/mapping609_sorted.bam /gpfs/scratch/chenx26/Assignment2/alignment/mapping609.bam
samtools index /gpfs/scratch/chenx26/Assignment2/alignment/mapping609_sorted.bam

samtools view -bS -o /gpfs/scratch/chenx26/Assignment2/alignment/mapping610.bam /gpfs/scratch/chenx26/Assignment2/alignment/mapping610.sam 
samtools sort -o /gpfs/scratch/chenx26/Assignment2/alignment/mapping610_sorted.bam /gpfs/scratch/chenx26/Assignment2/alignment/mapping610.bam
samtools index /gpfs/scratch/chenx26/Assignment2/alignment/mapping610_sorted.bam

samtools view -bS -o /gpfs/scratch/chenx26/Assignment2/alignment/mapping611.bam /gpfs/scratch/chenx26/Assignment2/alignment/mapping611.sam 
samtools sort -o /gpfs/scratch/chenx26/Assignment2/alignment/mapping611_sorted.bam /gpfs/scratch/chenx26/Assignment2/alignment/mapping611.bam
samtools index /gpfs/scratch/chenx26/Assignment2/alignment/mapping611_sorted.bam

samtools view -bS -o /gpfs/scratch/chenx26/Assignment2/alignment/mapping612.bam /gpfs/scratch/chenx26/Assignment2/alignment/mapping612.sam 
samtools sort -o /gpfs/scratch/chenx26/Assignment2/alignment/mapping612_sorted.bam /gpfs/scratch/chenx26/Assignment2/alignment/mapping612.bam
samtools index /gpfs/scratch/chenx26/Assignment2/alignment/mapping612_sorted.bam

samtools view -bS -o /gpfs/scratch/chenx26/Assignment2/alignment/mapping615.bam /gpfs/scratch/chenx26/Assignment2/alignment/mapping615.sam 
samtools sort -o /gpfs/scratch/chenx26/Assignment2/alignment/mapping615_sorted.bam /gpfs/scratch/chenx26/Assignment2/alignment/mapping615.bam
samtools index /gpfs/scratch/chenx26/Assignment2/alignment/mapping615_sorted.bam

samtools view -bS -o /gpfs/scratch/chenx26/Assignment2/alignment/mapping616.bam /gpfs/scratch/chenx26/Assignment2/alignment/mapping616.sam 
samtools sort -o /gpfs/scratch/chenx26/Assignment2/alignment/mapping616_sorted.bam /gpfs/scratch/chenx26/Assignment2/alignment/mapping616.bam
samtools index /gpfs/scratch/chenx26/Assignment2/alignment/mapping616_sorted.bam

samtools view -b -f 83 /gpfs/scratch/chenx26/Assignment2/alignment/mapping609_sorted.bam > /gpfs/scratch/chenx26/Assignment2/samtools/609_fwd1.bam
samtools view -b -f 163 /gpfs/scratch/chenx26/Assignment2/alignment/mapping609_sorted.bam > /gpfs/scratch/chenx26/Assignment2/samtools/609_fwd2.bam
samtools index /gpfs/scratch/chenx26/Assignment2/samtools/609_fwd1.bam
samtools index /gpfs/scratch/chenx26/Assignment2/samtools/609_fwd2.bam
samtools merge -f /gpfs/scratch/chenx26/Assignment2/samtools/609_fwd.bam /gpfs/scratch/chenx26/Assignment2/samtools/609_fwd1.bam /gpfs/scratch/chenx26/Assignment2/samtools/609_fwd2.bam
samtools index /gpfs/scratch/chenx26/Assignment2/samtools/609_fwd.bam
samtools view -b -f 99 /gpfs/scratch/chenx26/Assignment2/alignment/mapping609_sorted.bam > 609_rev1.bam
samtools view -b -f 147 /gpfs/scratch/chenx26/Assignment2/alignment/mapping609_sorted.bam > 609_rev2.bam
samtools index /gpfs/scratch/chenx26/Assignment2/samtools/609_rev1.bam
samtools index /gpfs/scratch/chenx26/Assignment2/samtools/609_rev2.bam
samtools merge -f /gpfs/scratch/chenx26/Assignment2/samtools/609_rev.bam /gpfs/scratch/chenx26/Assignment2/samtools/609_rev1.bam /gpfs/scratch/chenx26/Assignment2/samtools/609_rev2.bam
samtools index /gpfs/scratch/chenx26/Assignment2/samtools/609_rev.bam

samtools view -b -f 83 /gpfs/scratch/chenx26/Assignment2/alignment/mapping610_sorted.bam > /gpfs/scratch/chenx26/Assignment2/samtools/610_fwd1.bam
samtools view -b -f 163 /gpfs/scratch/chenx26/Assignment2/alignment/mapping610_sorted.bam > /gpfs/scratch/chenx26/Assignment2/samtools/610_fwd2.bam
samtools index /gpfs/scratch/chenx26/Assignment2/samtools/610_fwd1.bam
samtools index /gpfs/scratch/chenx26/Assignment2/samtools/610_fwd2.bam
samtools merge -f /gpfs/scratch/chenx26/Assignment2/samtools/610_fwd.bam /gpfs/scratch/chenx26/Assignment2/samtools/610_fwd1.bam /gpfs/scratch/chenx26/Assignment2/samtools/610_fwd2.bam
samtools index /gpfs/scratch/chenx26/Assignment2/samtools/610_fwd.bam
samtools view -b -f 99 /gpfs/scratch/chenx26/Assignment2/alignment/mapping610_sorted.bam > /gpfs/scratch/chenx26/Assignment2/samtools/610_rev1.bam
samtools view -b -f 147 /gpfs/scratch/chenx26/Assignment2/alignment/mapping610_sorted.bam > /gpfs/scratch/chenx26/Assignment2/samtools/610_rev2.bam
samtools index /gpfs/scratch/chenx26/Assignment2/samtools/610_rev1.bam
samtools index /gpfs/scratch/chenx26/Assignment2/samtools/610_rev2.bam
samtools merge -f /gpfs/scratch/chenx26/Assignment2/samtools/610_rev.bam /gpfs/scratch/chenx26/Assignment2/samtools/610_rev1.bam /gpfs/scratch/chenx26/Assignment2/samtools/610_rev2.bam
samtools index /gpfs/scratch/chenx26/Assignment2/samtools/610_rev.bam

samtools view -b -f 83 /gpfs/scratch/chenx26/Assignment2/alignment/mapping611_sorted.bam > /gpfs/scratch/chenx26/Assignment2/samtools/611_fwd1.bam
samtools view -b -f 163 /gpfs/scratch/chenx26/Assignment2/alignment/mapping611_sorted.bam > /gpfs/scratch/chenx26/Assignment2/samtools/611_fwd2.bam
samtools index /gpfs/scratch/chenx26/Assignment2/samtools/611_fwd1.bam
samtools index /gpfs/scratch/chenx26/Assignment2/samtools/611_fwd2.bam
samtools merge -f /gpfs/scratch/chenx26/Assignment2/samtools/611_fwd.bam /gpfs/scratch/chenx26/Assignment2/samtools/611_fwd1.bam /gpfs/scratch/chenx26/Assignment2/samtools/611_fwd2.bam
samtools index /gpfs/scratch/chenx26/Assignment2/samtools/611_fwd.bam
samtools view -b -f 99 /gpfs/scratch/chenx26/Assignment2/alignment/mapping611_sorted.bam > /gpfs/scratch/chenx26/Assignment2/samtools/611_rev1.bam
samtools view -b -f 147 /gpfs/scratch/chenx26/Assignment2/alignment/mapping611_sorted.bam > /gpfs/scratch/chenx26/Assignment2/samtools/611_rev2.bam
samtools index /gpfs/scratch/chenx26/Assignment2/samtools/611_rev1.bam
samtools index /gpfs/scratch/chenx26/Assignment2/samtools/611_rev2.bam
samtools merge -f /gpfs/scratch/chenx26/Assignment2/samtools/611_rev.bam /gpfs/scratch/chenx26/Assignment2/samtools/611_rev1.bam /gpfs/scratch/chenx26/Assignment2/samtools/611_rev2.bam
samtools index /gpfs/scratch/chenx26/Assignment2/samtools/611_rev.bam

samtools view -b -f 83 /gpfs/scratch/chenx26/Assignment2/alignment/mapping612_sorted.bam > /gpfs/scratch/chenx26/Assignment2/samtools/612_fwd1.bam
samtools view -b -f 163 /gpfs/scratch/chenx26/Assignment2/alignment/mapping612_sorted.bam > /gpfs/scratch/chenx26/Assignment2/samtools/612_fwd2.bam
samtools index /gpfs/scratch/chenx26/Assignment2/samtools/612_fwd1.bam
samtools index /gpfs/scratch/chenx26/Assignment2/samtools/612_fwd2.bam
samtools merge -f /gpfs/scratch/chenx26/Assignment2/samtools/612_fwd.bam /gpfs/scratch/chenx26/Assignment2/samtools/612_fwd1.bam /gpfs/scratch/chenx26/Assignment2/samtools/612_fwd2.bam
samtools index /gpfs/scratch/chenx26/Assignment2/samtools/612_fwd.bam
samtools view -b -f 99 /gpfs/scratch/chenx26/Assignment2/alignment/mapping612_sorted.bam > /gpfs/scratch/chenx26/Assignment2/samtools/612_rev1.bam
samtools view -b -f 147 /gpfs/scratch/chenx26/Assignment2/alignment/mapping612_sorted.bam > /gpfs/scratch/chenx26/Assignment2/samtools/612_rev2.bam
samtools index /gpfs/scratch/chenx26/Assignment2/samtools/612_rev1.bam
samtools index /gpfs/scratch/chenx26/Assignment2/samtools/612_rev2.bam
samtools merge -f /gpfs/scratch/chenx26/Assignment2/samtools/612_rev.bam /gpfs/scratch/chenx26/Assignment2/samtools/612_rev1.bam /gpfs/scratch/chenx26/Assignment2/samtools/612_rev2.bam
samtools index /gpfs/scratch/chenx26/Assignment2/samtools/612_rev.bam

samtools view -b -f 83 /gpfs/scratch/chenx26/Assignment2/alignment/mapping615_sorted.bam > 615_fwd1.bam
samtools view -b -f 163 /gpfs/scratch/chenx26/Assignment2/alignment/mapping615_sorted.bam > 615_fwd2.bam
samtools index 615_fwd1.bam
samtools index 615_fwd2.bam
samtools merge -f 615_fwd.bam 615_fwd1.bam 615_fwd2.bam
samtools index 615_fwd.bam
samtools view -b -f 99 /gpfs/scratch/chenx26/Assignment2/alignment/mapping615_sorted.bam > 615_rev1.bam
samtools view -b -f 147 /gpfs/scratch/chenx26/Assignment2/alignment/mapping615_sorted.bam > 615_rev2.bam
samtools index 615_rev1.bam
samtools index 615_rev2.bam
samtools merge -f 615_rev.bam 615_rev1.bam 615_rev2.bam
samtools index 615_rev.bam

samtools view -b -f 83 /gpfs/scratch/chenx26/Assignment2/alignment/mapping616_sorted.bam > 616_fwd1.bam
samtools view -b -f 163 /gpfs/scratch/chenx26/Assignment2/alignment/mapping616_sorted.bam > 616_fwd2.bam
samtools index 616_fwd1.bam
samtools index 616_fwd2.bam
samtools merge -f 616_fwd.bam 616_fwd1.bam 616_fwd2.bam
samtools index 616_fwd.bam
samtools view -b -f 99 /gpfs/scratch/chenx26/Assignment2/alignment/mapping616_sorted.bam > 616_rev1.bam
samtools view -b -f 147 /gpfs/scratch/chenx26/Assignment2/alignment/mapping616_sorted.bam > 616_rev2.bam
samtools index 616_rev1.bam
samtools index 616_rev2.bam
samtools merge -f 616_rev.bam 616_rev1.bam 616_rev2.bam
samtools index 616_rev.bam
