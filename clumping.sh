#PBS -S /bin/bash
#PBS -N clumping
#PBS -A ##
#PBS -o ##
#PBS -e ##
#PBS -l select=1:ncpus=1:intel=True:mem=30GB
#PBS -l walltime=24:00:00
#PBS -J 1-22

i=$PBS_ARRAY_INDEX
ref="ukbEUR_imp_chr${i}_v3_impQC"
maf_snplist="UKB_EUR_impQC_maf0.01.snplist"
file_in="SUMSTATS"
file_out="NAME_chr${i}"

plink2 --bfile $ref --extract $maf_snplist --clump $file_in --clump-p1 5e-8 --clump-p2 5e-8 --clump-r2 0.01 --clump-kb 1000 --clump-field P --out $file_out

