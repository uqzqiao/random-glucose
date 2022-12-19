library(data.table)
library(dplyr)
library(purrr)

# Real Data
setwd("")
# chi-square, lambda_GC, # number of GWS loic

# inverse weighted meta-analysis
ss=read.table("SampleSize", h=F)
meta=list()
files=list.files(pattern="*h.bolt$")
for (i in 1:5) {
    file=paste0(files[i])
    df=fread(file, h=T)
    df=as.data.frame(df)
    df=as_tibble(df)
    df$N=as.numeric(ss[i,1]) * (1-df$F_MISS)
    df=df %>% mutate(weight=1/(SE^2)) %>% mutate(upper=BETA*weight) %>% mutate(NE=N*A1FREQ)
    meta[[i]]=df
}
upp=select(meta[[1]], upper)
for (i in 2:5) {
    upp=upp+select(meta[[i]], upper)
}
low=select(meta[[1]], weight)
for (i in 2:5) {
    low=low+select(meta[[i]], weight)
}
NEall=select(meta[[1]], NE)
for (i in 2:5) {
    NEall=NEall+select(meta[[i]], NE)
}
Nall=select(meta[[1]], N)
for (i in 2:5) {
    Nall=Nall+select(meta[[i]], N)
}

beta_meta=as.matrix(upp)/as.matrix(low)
var_meta=1/as.matrix(low)
se_meta=sqrt(as.numeric(1/as.matrix(low)))
AF1_meta=NEall/Nall
N_meta=Nall
Z_meta=beta_meta/se_meta
P_meta=pchisq(Z_meta^2, 1, lower.tail = F)
mean(Z_meta^2)
median(Z_meta^2)/qchisq(0.5,1)
length(which(P_meta<5E-8))

out=bind_cols(select(meta[[1]], SNP:BP, ALLELE1:ALLELE0), as_tibble(AF1_meta), as_tibble(beta_meta), as_tibble(se_meta), as_tibble(P_meta), as_tibble(N_meta))
colnames(out)[6:10]=c("A1FREQ", "BETA", "SE", "P", "N")

snbuf=which(out$A1FREQ>0.5)
t=out[snbuf,"ALLELE1"]
out[snbuf,"ALLELE1"]=out[snbuf,"ALLELE0"]
out[snbuf,"ALLELE0"]=t
out[snbuf,"BETA"]=out[snbuf,"BETA"]*(-1)
out[snbuf,"A1FREQ"]=1-out[snbuf,"A1FREQ"]

write.table(out, "glucose_manual_ivmeta", quote=F, col.names=T, row.names=F)

# COJO format
df=fread("glucose_manual_ivmeta", h=T)
df=as.data.frame(df)
df=as_tibble(df)

df2=select(df, SNP, ALLELE1:N)
colnames(df2)=c("SNP","A1","A2","freq","b","se","P","N")
write.table(df2, "glucose_manual_ivmeta_COJO_format", row.names=F, col.names=T, quote=F)

