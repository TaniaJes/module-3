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

module load trimgalore/0.5.0
module load python/cpu/3.6.5
module load fastqc
trim_galore --paired --length 30 -q 30 -o /gpfs/scratch/ccz221/trimmed --fastqc /gpfs/scratch/ccz221/test_1.fastq /gpfs/scratch/ccz221/test_2.fastq
trim_galore --paired --length 30 -q 30 -o /gpfs/scratch/ccz221/trimmed --fastqc /gpfs/scratch/ccz221/SRR7049609_1.fastq /gpfs/scratch/ccz221/SRR7049609_2.fastq
trim_galore --paired --length 30 -q 30 -o /gpfs/scratch/ccz221/trimmed --fastqc /gpfs/scratch/ccz221/SRR7049610_1.fastq /gpfs/scratch/ccz221/SRR7049610_2.fastq
trim_galore --paired --length 30 -q 30 -o /gpfs/scratch/ccz221/trimmed --fastqc /gpfs/scratch/ccz221/SRR7049611_1.fastq /gpfs/scratch/ccz221/SRR7049611_2.fastq
trim_galore --paired --length 30 -q 30 -o /gpfs/scratch/ccz221/trimmed --fastqc /gpfs/scratch/ccz221/SRR7049612_1.fastq /gpfs/scratch/ccz221/SRR7049612_2.fastq
trim_galore --paired --length 30 -q 30 -o /gpfs/scratch/ccz221/trimmed --fastqc /gpfs/scratch/ccz221/SRR7049615_1.fastq /gpfs/scratch/ccz221/SRR7049615_2.fastq
trim_galore --paired --length 30 -q 30 -o /gpfs/scratch/ccz221/trimmed --fastqc /gpfs/scratch/ccz221/SRR7049616_1.fastq /gpfs/scratch/ccz221/SRR7049616_2.fastq