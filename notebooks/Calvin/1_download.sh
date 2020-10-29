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
module load sratoolkit/2.10.8
fasterq-dump -O /gpfs/scratch/ccz221 -f -e 16 SRR7049616
fasterq-dump -O /gpfs/scratch/ccz221 -f -e 16 SRR7049615
fasterq-dump -O /gpfs/scratch/ccz221 -f -e 16 SRR7049609
fasterq-dump -O /gpfs/scratch/ccz221 -f -e 16 SRR7049610
fasterq-dump -O /gpfs/scratch/ccz221 -f -e 16 SRR7049611
fasterq-dump -O /gpfs/scratch/ccz221 -f -e 16 SRR7049612