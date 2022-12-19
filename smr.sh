#PBS -S /bin/bash
#PBS -N del
#PBS -A 
#PBS -o 
#PBS -e 
#PBS -l select=1:ncpus=12:intel=True:mem=30GB
#PBS -l walltime=10:00:00
#PBS -J 1-22

i=$PBS_ARRAY_INDEX

ld_ref="ukbEURu_imp_chr${i}_v3_impQC"
snplist="UKB_EUR_impQC_maf0.01.snplist"
sumstats="glucose_COJO_format"
eqtlgen="eQTLGen_Download"
file_out="smr_eQTLGen_random-glucose_chr${i}"

smr --bfile ${ld_ref} --extract-snp ${snplist} --maf 0.01 --gwas-summary ${sumstats} --beqtl-summary ${eqtlgen} --out ${file_out} >> smr_eQTLGen_random-glucose_chr${i}.log 2>&1 --thread-num 16

