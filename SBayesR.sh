#PBS -S /bin/bash
#PBS -N SBayesR
#PBS -A 
#PBS -o 
#PBS -e 
#PBS -l select=1:ncpus=12:intel=True:mem=60GB
#PBS -l walltime=24:00:00

sum="IV_meta_COJO_format"
out="random_glucose"
mldm="band_ukb_10k_hm3.mldm"

gctb --sbayes R --mldm $mldm --gwas-summary $sum --pi 0.01 --hsq 0.5 --chain-length 25000 --burn-in 5000 --seed 12345 --thread 12 --no-mcmc-bin --out $out > $out.log 2>&1

