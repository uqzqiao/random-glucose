#PBS -S /bin/bash
#PBS -N 
#PBS -A 
#PBS -o 
#PBS -e 
#PBS -l select=1:ncpus=16:intel=True:mem=10GB
#PBS -l walltime=24:00:00

grm="v3EURu_impQC"
pheno="HEreg_bivar_pheno"

gcta64 --HEreg-bivar P1 P2 --grm $grm --pheno $pheno --thread-num 16 --out PH1_PH2_HEreg
