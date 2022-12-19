for i in {1..116}
do
   probe=$(awk 'NR == '${i}' {print $1}' PROBE_ID_eQTLgen.txt)
   sed 's/PROBE_ID/'${probe}'/g' plot_PROBE_ID.R > plot_${probe}.R
   sed 's/PROBE_ID/'${probe}'/g' plot_PROBE_ID.job > plot_${probe}.sh
   qsub plot_${probe}.sh 
done
