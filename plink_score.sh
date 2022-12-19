#PBS -S /bin/bash
#PBS -N plink
#PBS -A 
#PBS -o 
#PBS -e 
#PBS -l select=1:ncpus=1:intel=True:mem=5GB
#PBS -l walltime=10:00:00
#PBS -J 1-22

i=$PBS_ARRAY_INDEX;
 
geno="ukbEUR_imp_chr${i}_v3_impQC"
score="prs.model.file"
output="cojo_b_chr${i}"

plink2 --bfile $geno --score $score --out $output


