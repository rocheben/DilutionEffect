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
#elige un numero aletorio entero entre 0 y 40. n es la riqueza espec?fica de los host 
m=round(runif(1, 2,41),0) 

#este valor viene en elñ script pref iguales
  
#Poblaciones de vectores
Nvj=round(runif(n, 1,10^6),0)
#Poblaciones de host
Nhi=round(runif(m, 2,10^4),0)

#dhi=Death rate of hosts of species i 
dhi=runif(m,1/(80*360), 1/60)

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

#nui Incubation rate in host i 
#nu=runif(m, 1/30, 1)
nu=runif(m, 1, 30)

#Sigmahi=Hosts' total duration at infectious stage
Sigma_hi=runif(m, 1/60, 1/5) 

#Tvj: Probability of vector j to acquire the infection 
Tao_vj=runif(n, 0, 1)

#Para construir la matriz lambda hivj

#bvj biting rate 
bvj=runif(n, 1/5, 1)

