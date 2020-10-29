#!/bin/bash
#SBATCH --job-name=MAPQ_count
#SBATCH --mail-type=ALL
#SBATCH --mail-user=xc2121@nyu.edu
#SBATCH --ntasks=1  
#SBATCH --mem=10gb 
#SBATCH --output=./slurm_%A_%a.log 
#SBATCH -p cpu_short
#SBATCH --time=24:00:00

cut -f 5 mapping609.sam | sort | uniq -c > count_609.txt
cut -f 5 mapping610.sam | sort | uniq -c > count_610.txt
cut -f 5 mapping611.sam | sort | uniq -c > count_611.txt
cut -f 5 mapping612.sam | sort | uniq -c > count_612.txt
cut -f 5 mapping615.sam | sort | uniq -c > count_615.txt
cut -f 5 mapping616.sam | sort | uniq -c > count_616.txt
