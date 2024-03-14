#library(ggplot2)

#Codigo ED Modelo R0 

#Parametres Phi's 
#phi_iv=phi_v1,
#m: number of vector species  
#n: number of host species
#Nhi: total pop of host of species i 
#Nvj: total pop vector of species j 


#set.seed(format(Sys.time(), format = "%S"))
set.seed(NULL)

#riqueza especifica de los vectores 
n=round(runif(1,1, 11),0)

#elige un numero aletorio entero entre 2 y 40. n es la riqueza específica de los host 
m=round(runif(1, 2,41),0) 

m1=round(runif(1, 1, m),0)

#elejimos m1 especies de m especies 
host_m1=sample(1:m, m1, replace=FALSE)


#Poblaciones de vectores
Nvj=round(runif(n, 1,10^6),0)

#Poblaciones de host
Nhi=round(runif(m, 2,10^4),0)
#Aquí elejimos las mismas especies de hospederos pero con la misma abundancia 
Nhi_1=round(runif(length(host_m1), 2,10^4),0)

#si quisieramos que eligiera las abundancias en la misma proporción
#Nhi_1=Nhi[host_m1]

#dhi=Death rate of hosts of species i 
dhi=runif(m,1/(80*360), 1/60)
dhi_1=dhi[host_m1]

#dv Death rate of vectors
dvj=runif(n, 1/15, 1)

#parametros
#Bhi y Bhv se eligieron con la condici?n del diseases-free equilibrium 
#i.e. Ni=Bi/hi

#No se necesitan 
#Bhi Host recruitment of specie i 
#Bhi=dhi*Nhi

#Bvj Vector recruitment of specie j 
#Bvj=dvj*Nvj

#Thi: Probability of host i to acquire the infection  per bite 
Tao_hi=runif(m, 0, 1)
Tao_hi_1=Tao_hi[host_m1]

#nui Incubation rate in host i 
#nu=runif(m, 1/30, 1)
nu=runif(m, 1, 30)
nu_1=nu[host_m1]

#Sigmahi=Hosts' total duration at infectious stage
Sigma_hi=runif(m, 1/60, 1/5) 
Sigma_hi_1=Sigma_hi[host_m1]

#Tvj: Probability of vector j to acquire the infection 
Tao_vj=runif(n, 0, 1)

#Para construir la matriz lambda hivj

#bvj biting rate 
bvj=runif(n, 1/5, 1)

