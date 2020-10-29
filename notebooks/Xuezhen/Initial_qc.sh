#!/bin/bash 
#SBATCH --job-name=Initial_qc 
#SBATCH --mail-type=ALL # Mail events (NONE, BEGIN, END, FAIL, ALL) 
#SBATCH --mail-user=xc2121@nyu.edu  
#SBATCH --ntasks=1 
#SBATCH --mem=40gb
#SBATCH --time=12:00:00 
#SBATCH --output=./slurm_%A_%a.log 
#SBATCH -p cpu_short
#SBATCH --array=609-612,615,616

module load module load fastqc/0.11.7

DIRECTORY=/gpfs/scratch/chenx26/Assignment2/SRA
DATA_ID="7049"

fastqc -o /gpfs/scratch/chenx26/Assignment2/fastqc/ $DIRECTORY/SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_1.fastq.gz $DIRECTORY/SRR${DATA_ID}${SLURM_ARRAY_TASK_ID}_2.fastq.gz

multiqc .
