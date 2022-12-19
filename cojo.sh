#PBS -S /bin/bash
#PBS -N cojo_unrel
#PBS -A ##
#PBS -o ##
#PBS -e ##
#PBS -l select=1:ncpus=14:intel=True:mem=10GB
#PBS -l walltime=2:00:00
#PBS -J 1-22

i=$PBS_ARRAY_INDEX;

ldref="ukbEURu_imp_chr${i}_v3_impQC_random20K_maf01"
snplist="UKB_v3EURu_impQC/UKB_EUR_impQC_maf0.01.snplist"
sumstats="../SUMSTATS"
output="NAME_chr${i}"

gcta64 --bfile $ldref --extract $snplist --cojo-slct --cojo-file $sumstats --cojo-p 5e-8 --cojo-wind 10000 --out $output >> ${output}.log 2>&1 --thread-num 14

