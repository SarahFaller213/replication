# NGWAS<-seq(from = 1000, to = 50000, by=1000)
# N<-seq(from = 100, to=5000, by=100)
# lamda<-seq(from=0, to=0.05, by=0.05)
# mGWAS=100000
# mRep=1

#calculates the true positives/ power association 
power <- function(N, lamda, m) {
  alphaStar = 0.05/m
  power <- pnorm(qnorm(alphaStar/2)+lamda*sqrt(N))+1-pnorm(-qnorm(alphaStar/2)+lamda*sqrt(N))
  return(power)
}