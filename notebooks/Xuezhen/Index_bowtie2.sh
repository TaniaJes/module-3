#!/bin/bash
#SBATCH --job-name=indexing_bowtie2 
#SBATCH --mail-type=ALL  
#SBATCH --mail-user=xc2121@nyu.edu  
#SBATCH --ntasks=1  
#SBATCH --mem=40gb  
#SBATCH --time=24:00:00  
#SBATCH --output=./slurm_%A_%a.log 
#SBATCH -p cpu_short

module load bowtie2/2.4.1
module load python/cpu/3.6.5
bowtie2-build -f /gpfs/share/apps/iGenomes/Homo_sapiens/UCSC/hg38/Sequence/WholeGenomeFasta/genome.fa HG38
