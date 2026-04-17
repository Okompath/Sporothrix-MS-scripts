#!/bin/bash -l
#SBATCH --nodes 1 --mem 150G --ntasks 12 --time 10-00:00:00 

ml anaconda
conda activate twisst

# you will need a set of gene trees where all trees have the same set of tips, and a groups file that assigns each tip to a group (population).
# The groups file should be a tab-delimited text file with two columns: the first column contains the tip names (matching those in the gene trees),
# and the second column contains the group names. You can specify as many groups as you like, but each tip must be assigned to exactly one group.
# a pruned set of gene trees can be generated in R.

python3 twisst/twisst.py -t pruned_geneTrees2.tree -w sporo_twisst.weights.csv.gz \
--outgroup luriei --outputTopos sporo_twisst.trees -g globosa -g schenckii -g brasiliensis -g luriei \
--method complete --groupsFile sporo_twisst_groups.txt