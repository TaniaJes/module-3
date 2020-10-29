#!/bin/bash
#SBATCH --job-name=alignment_bowtie2 
#SBATCH --mail-type=ALL  
#SBATCH --mail-user=xc2121@nyu.edu  
#SBATCH --ntasks=1  
#SBATCH --mem=40gb  
#SBATCH --time=24:00:00  
#SBATCH --output=./slurm_%A_%a.log 
#SBATCH -p cpu_medium
#SBATCH --cpus-per-task=16

module load bowtie2/2.4.1
module load python/cpu/3.6.5

bowtie2 -x ./index/HG38 -1 /gpfs/scratch/chenx26/Assignment2/trimgalore/SRR7049609_1_val_1.fq.gz -2 /gpfs/scratch/chenx26/Assignment2/trimgalore/SRR7049609_2_val_2.fq.gz -S /gpfs/scratch/chenx26/Assignment2/alignment/mapping609.sam
bowtie2 -x ./index/HG38 -1 /gpfs/scratch/chenx26/Assignment2/trimgalore/SRR7049610_1_val_1.fq.gz -2 /gpfs/scratch/chenx26/Assignment2/trimgalore/SRR7049610_2_val_2.fq.gz -S /gpfs/scratch/chenx26/Assignment2/alignment/mapping610.sam
bowtie2 -x ./index/HG38 -1 /gpfs/scratch/chenx26/Assignment2/trimgalore/SRR7049611_1_val_1.fq.gz -2 /gpfs/scratch/chenx26/Assignment2/trimgalore/SRR7049611_2_val_2.fq.gz -S /gpfs/scratch/chenx26/Assignment2/alignment/mapping611.sam
bowtie2 -x ./index/HG38 -1 /gpfs/scratch/chenx26/Assignment2/trimgalore/SRR7049612_1_val_1.fq.gz -2 /gpfs/scratch/chenx26/Assignment2/trimgalore/SRR7049612_2_val_2.fq.gz -S /gpfs/scratch/chenx26/Assignment2/alignment/mapping612.sam
bowtie2 -x ./index/HG38 -1 /gpfs/scratch/chenx26/Assignment2/trimgalore/SRR7049615_1_val_1.fq.gz -2 /gpfs/scratch/chenx26/Assignment2/trimgalore/SRR7049615_2_val_2.fq.gz -S /gpfs/scratch/chenx26/Assignment2/alignment/mapping615.sam
bowtie2 -x ./index/HG38 -1 /gpfs/scratch/chenx26/Assignment2/trimgalore/SRR7049616_1_val_1.fq.gz -2 /gpfs/scratch/chenx26/Assignment2/trimgalore/SRR7049616_2_val_2.fq.gz -S /gpfs/scratch/chenx26/Assignment2/alignment/mapping616.sam
