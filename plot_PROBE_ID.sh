#PBS -S /bin/bash
#PBS -N smr_plot_PROBE_ID
#PBS -A 
#PBS -o 
#PBS -e 
#PBS -l select=1:ncpus=1:intel=True:mem=5GB
#PBS -l walltime=5:00:00

Rscript plot_PROBE_ID.R
