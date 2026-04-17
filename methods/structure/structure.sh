#!/bin/bash -l
#SBATCH --ntasks 12 --nodes 1 --mem 50g --time 04-00:00:00

ml anaconda
conda activate struct_threader

# use bed file from plink2 unfiltered output
structure_threader run -i Sporo_all.bed \
-o sporo_test2025_6 \
-t 10 \
-K 4 \
-fs /nas/longleaf/home/okompath/.local/bin/fastStructure \

#use the pops.txt file to assign individuals to populations
--ind pops.txt
