#!/bin/bash
#SBATCH --job-name=bedtools
#SBATCH --mail-type=ALL  
#SBATCH --mail-user=xc2121@nyu.edu  
#SBATCH --ntasks=1 
#SBATCH --mem=40gb 
#SBATCH --output=./slurm_%A_%a.log
#SBATCH -p cpu_short
#SBATCH --time=24:00:00

module load bedtools/2.27.1
module load samtools/1.9

samtools view -b /gpfs/scratch/chenx26/Assignment2/samtools/609_fwd.bam | genomeCoverageBed -ibam stdin -bg -split > /gpfs/scratch/chenx26/Assignment2/samtools/609_fwd.bedgraph
samtools view -b /gpfs/scratch/chenx26/Assignment2/samtools/609_rev.bam | genomeCoverageBed -ibam stdin -bg -split > /gpfs/scratch/chenx26/Assignment2/samtools/609_rev.bedgraph

samtools view -b /gpfs/scratch/chenx26/Assignment2/samtools/610_fwd.bam | genomeCoverageBed -ibam stdin -bg -split > /gpfs/scratch/chenx26/Assignment2/samtools/610_fwd.bedgraph
samtools view -b /gpfs/scratch/chenx26/Assignment2/samtools/610_rev.bam | genomeCoverageBed -ibam stdin -bg -split > /gpfs/scratch/chenx26/Assignment2/samtools/610_rev.bedgraph

samtools view -b /gpfs/scratch/chenx26/Assignment2/samtools/611_fwd.bam | genomeCoverageBed -ibam stdin -bg -split > /gpfs/scratch/chenx26/Assignment2/samtools/611_fwd.bedgraph
samtools view -b /gpfs/scratch/chenx26/Assignment2/samtools/611_rev.bam | genomeCoverageBed -ibam stdin -bg -split > /gpfs/scratch/chenx26/Assignment2/samtools/611_rev.bedgraph

samtools view -b /gpfs/scratch/chenx26/Assignment2/samtools/612_fwd.bam | genomeCoverageBed -ibam stdin -bg -split > /gpfs/scratch/chenx26/Assignment2/samtools/612_fwd.bedgraph
samtools view -b /gpfs/scratch/chenx26/Assignment2/samtools/612_rev.bam | genomeCoverageBed -ibam stdin -bg -split > /gpfs/scratch/chenx26/Assignment2/samtools/612_rev.bedgraph

samtools view -b /gpfs/scratch/chenx26/Assignment2/samtools/615_fwd.bam | genomeCoverageBed -ibam stdin -bg -split > /gpfs/scratch/chenx26/Assignment2/samtools/615_fwd.bedgraph
samtools view -b /gpfs/scratch/chenx26/Assignment2/samtools/615_rev.bam | genomeCoverageBed -ibam stdin -bg -split > /gpfs/scratch/chenx26/Assignment2/samtools/615_rev.bedgraph

samtools view -b /gpfs/scratch/chenx26/Assignment2/samtools/616_fwd.bam | genomeCoverageBed -ibam stdin -bg -split > /gpfs/scratch/chenx26/Assignment2/samtools/616_fwd.bedgraph
samtools view -b /gpfs/scratch/chenx26/Assignment2/samtools/616_rev.bam | genomeCoverageBed -ibam stdin -bg -split > /gpfs/scratch/chenx26/Assignment2/samtools/616_rev.bedgraph
