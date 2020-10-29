#!/bin/bash 
#SBATCH --job-name=TrimGalore
#SBATCH --mail-type=ALL (NONE, BEGIN, END, FAIL, ALL) 
#SBATCH --mail-user=xc2121@nyu.edu  
#SBATCH --ntasks=1 
#SBATCH --mem=40gb
#SBATCH --time=12:00:00 
#SBATCH --output=./slurm_%A_%a.log 
#SBATCH -p cpu_short

module load fastqc/0.11.7
module load trimgalore/0.5.0
module load python/cpu/2.7.15-ES

trim_galore --paired -q 30 --length 30 /gpfs/scratch/chenx26/Assignment2/SRA/SRR7049609_1.fastq.gz /gpfs/scratch/chenx26/Assignment2/SRA/SRR7049609_2.fastq.gz --fastqc

trim_galore --paired -q 30 --length 30 /gpfs/scratch/chenx26/Assignment2/SRA/SRR7049610_1.fastq.gz /gpfs/scratch/chenx26/Assignment2/SRA/SRR7049610_2.fastq.gz --fastqc

trim_galore --paired -q 30 --length 30 /gpfs/scratch/chenx26/Assignment2/SRA/SRR7049611_1.fastq.gz /gpfs/scratch/chenx26/Assignment2/SRA/SRR7049611_2.fastq.gz --fastqc

trim_galore --paired -q 30 --length 30 /gpfs/scratch/chenx26/Assignment2/SRA/SRR7049612_1.fastq.gz /gpfs/scratch/chenx26/Assignment2/SRA/SRR7049612_2.fastq.gz --fastqc

trim_galore --paired -q 30 --length 30 /gpfs/scratch/chenx26/Assignment2/SRA/SRR7049615_1.fastq.gz /gpfs/scratch/chenx26/Assignment2/SRA/SRR7049615_2.fastq.gz --fastqc

trim_galore --paired -q 30 --length 30 /gpfs/scratch/chenx26/Assignment2/SRA/SRR7049616_1.fastq.gz /gpfs/scratch/chenx26/Assignment2/SRA/SRR7049616_2.fastq.gz --fastqc
