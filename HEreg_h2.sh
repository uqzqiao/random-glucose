#PBS -S /bin/bash
#PBS -N ##
#PBS -A ##
#PBS -o ##
#PBS -e ##
#PBS -l select=1:ncpus=16:intel=True:mem=10GB
#PBS -l walltime=24:00:00

grm="v3EURu_impQC"
pheno="Adjusted_pheno"

gcta64 --HEreg --grm $grm --pheno $pheno --out 0-24h --thread-num 16


