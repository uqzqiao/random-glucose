#PBS -S /bin/bash
#PBS -N lmm
#PBS -A ##
#PBS -o ##
#PBS -e ##
#PBS -l select=1:ncpus=32:intel=True:mem=100GB
#PBS -l walltime=120:00:00

phen="glucose_0-24h"
exsnp="UKB_EUR_impQC_maf0.01_EXCLUDE.snplist"
bim="ukbEUR_imp_chr{1:22}_v3_impQC.bim"
bed="ukbEUR_imp_chr1_v3_impQC.fam"
fam="ukbEUR_imp_chr1_v3_impQC.fam"
covar="Covars_BOLT_batch_2L"
table="LDSCORE.1000G_EUR.tab.gz"
map="genetic_map_hg19_withX.txt.gz"
modelSnps="ukbEUR_imp_allchr_v3_HM3_maf01_R9.prune.in"
out="glucose_0-24h_FT.bolt"

bolt --bed=$bed --bim=$bim --fam=$fam --exclude $exsnp --phenoFile=$phen --phenoCol=glucose --covarFile $covar --covarCol=gender --covarCol=batch --covarCol=assessment_centre --qCovarCol=fasting_time --qCovarCol=age_at_assessment --qCovarCol=PC{1:40} --covarMaxLevels 60 --lmm --modelSnps=$modelSnps --LDscoresFile=$table --geneticMapFile=$map --statsFile=$out --numThreads 32 2>&1 | tee $out.log



