source("plot_epiSMR_yang.r")
probe="PROBE_ID"

## Read the setting file
set=read.table("smr_plot_setting_eQTLgen.txt", h=T)

name=set[set$probeID==probe,"filename"]
chr=set[set$probeID==probe,"ProbeChr"]

plotfile=paste0("chr", chr, ".", probe, ".txt")
plotdata=ReadSMRData(plotfile);

## Set window size
window=set[set$probeID==probe, "window"]

## Set top eQTL
top=as.character(set[set$probeID==probe, "topSNP"])

## Set p_SMR threshold
smr_thresh=3.238552e-06; smr_thresh_plot=3.238552e-06;

png(paste0(name,".png"), width=15, height=18, units='in', bg="transparent", res=150, type=c("cairo"))

SMRLocusPlot(data=plotdata, probeNEARBY=probe, smr_thresh, smr_thresh_plot, heidi_thresh=0.01, heidi_thresh_plot=0, plotWindow=window, pointsize=20, max_anno_probe=5, highlight=top, epi_plot=T, anno_self=T, plotBP=NULL, annoSig_only=F)

dev.off()

