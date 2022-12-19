###############
#    Munge    #
###############

#PBS -S /bin/bash
#PBS -N munge
#PBS -A 
#PBS -o 
#PBS -e 
#PBS -l select=1:ncpus=1:intel=True:mem=5GB
#PBS -l walltime=2:00:00

module use /scratch/old_mod/Modules/Modulefiles
module load ldsc/1.0.0

panel="w_hm3.snplist"
sumstats="PHENOTYPE"
output=OUTNAME

munge_sumstats.py --merge-alleles $panel --sumstats $sumstats --chunksize 500000 --out $output

###############
#     h2      #
###############
#PBS -S /bin/bash
#PBS -N munge
#PBS -A
#PBS -o
#PBS -e
#PBS -l select=1:ncpus=1:intel=True:mem=5GB
#PBS -l walltime=2:00:00

module use /scratch/old_mod/Modules/Modulefiles
module load ldsc/1.0.0

ld="./ldsc/eur_w_ld_chr/"
sumstats="PHENOTYPE"
output=OUTNAME

ldsc.py --h2 ${sumstats} --ref-ld-chr $ld --w-ld-chr $ld --out $output

###############
#     rg      #
###############

module use /scratch/old_mod/Modules/Modulefiles
module load ldsc/1.0.0

ld="./ldsc/eur_w_ld_chr/"
pheno="PHENOTYPE.sumstats.gz"

FG="FG_combined_1000G_density.sumstats.gz"
output=OUTNAME

ldsc.py --rg ${FG},${pheno} --ref-ld-chr $ld --w-ld-chr $ld --out $output


