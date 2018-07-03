args = commandArgs(trailingOnly=TRUE)
datafile = args[1]

Data=read.csv(datafile,header=F,sep=" ")
colnames(Data) <- c("N_GWAS","N_Rep","lambda","power","both_positive")

#installing packages
#install.packages('ggplot2')
library(ggplot2)

#install.packages("reshape2")
library(reshape2)
list<-c("0.01","0.02", "0.03", "0.04", "0.05")

for( i in 1:5){
  name_temp = paste(list[i], "power", ".pdf")
  name_temp2 = paste(list[i], "both_positive", ".pdf")
  
  temp_graph <- ggplot(subset(Data,lambda==i*0.01),aes(x=N_GWAS,y=N_Rep))+geom_tile(aes(fill = power), colour = "white") + scale_fill_gradient(low = "white", high = "steelblue")
  ggsave(name_temp)
  graph_temp <- ggplot(subset(Data,lambda==i*0.01),aes(x=N_GWAS,y=N_Rep))+geom_tile(aes(fill = both_positive))
  ggsave(name_temp2)
  
}