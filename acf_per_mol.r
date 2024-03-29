setwd("C:/Users/pedro/paper_voro_analises/dppca62g53a6t323/")
require(graphics)

mol_list <- seq(1,64,1)
areaur <- c()
areadr <- c()
acf_average <- c()
susceptibility_u <- c()
susceptibility_d <- c()


for (j in mol_list) {
areaur[j] <- as.vector(read.table((file=paste("areamoldppca62g53a6t323b0e200ur",j,".dat",sep=""))))
areadr[j] <- as.vector(read.table((file=paste("areamoldppca62g53a6t323b0e200dr",j,".dat",sep=""))))

file.create(file=paste("c:/users/pedro/paper_voro_analises/dppca62g53a6t323/acfareadppca62g53a6t323b0e200ur",j,".dat",sep=""),overwrite=T)
file.create(file=paste("c:/users/pedro/paper_voro_analises/dppca62g53a6t323/acfareadppca62g53a6t323b0e200dr",j,".dat",sep=""),overwrite=T)

file.create(file=paste("c:/users/pedro/paper_voro_analises/dppca62g53a6t323/susceptibilitydppca62g53a6t323b0e200ur",j,".dat",sep=""),overwrite=T)
file.create(file=paste("c:/users/pedro/paper_voro_analises/dppca62g53a6t323/susceptibilitydppca62g53a6t323b0e200dr",j,".dat",sep=""),overwrite=T)

nlag <- seq(1,length(acf(areaur[[j]],plot=F,lag.max=300)$acf),1)

t <- seq(1:(length(nlag)-1))
for (i in t) {
susceptibility_u[i] <- (acf(areaur[[j]],plot=F,lag.max=300)$acf[1]-acf(areaur[[j]],plot=F,lag.max=300)$acf[i])
susceptibility_d[i] <- (acf(areadr[[j]],plot=F,lag.max=300)$acf[1]-acf(areadr[[j]],plot=F,lag.max=300)$acf[i])
cat(susceptibility_u[i], "\n",file=paste("c:/users/pedro/paper_voro_analises/dppca62g53a6t323/susceptibilitydppca62g53a6t323b0e200ur",j,".dat",sep=""),append=TRUE)
cat(susceptibility_d[i], "\n",file=paste("c:/users/pedro/paper_voro_analises/dppca62g53a6t323/susceptibilitydppca62g53a6t323b0e200dr",j,".dat",sep=""),append=TRUE)
}

for (i in nlag) {

# cat( acf(areaur[[j]],plot=F)$lag[i], "   ",  acf(areaur[[j]],plot=F)$acf[i], "\n",file=paste("c:/users/paloureiro/paper_voro_analises/dppca62g53a6t323/acfareadppca62g53a6t323b0e200ur",j,".dat",sep=""),append=TRUE)
# cat( acf(areadr[[j]],plot=F)$lag[i], "   ",  acf(areadr[[j]],plot=F)$acf[i], "\n",file=paste("c:/users/paloureiro/paper_voro_analises/dppca62g53a6t323/acfareadppca62g53a6t323b0e200dr",j,".dat",sep=""),append=TRUE)
cat( acf(areaur[[j]],plot=F,lag.max=300)$acf[i], "\n",file=paste("c:/users/pedro/paper_voro_analises/dppca62g53a6t323/acfareadppca62g53a6t323b0e200ur",j,".dat",sep=""),append=TRUE)
cat( acf(areadr[[j]],plot=F,lag.max=300)$acf[i], "\n",file=paste("c:/users/pedro/paper_voro_analises/dppca62g53a6t323/acfareadppca62g53a6t323b0e200dr",j,".dat",sep=""),append=TRUE)
}
cat(j,"\n")
}


