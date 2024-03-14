#ciclos NGM Preferencias iguales 
#en este código se dejan fijos los vectores, se fijan los reservorios
#y se extrae un subconjunto de los reservorios con abundancia de las 
#espcecies siempre menor 
library(ggplot2)
library(pracma)

#Codigo ED Modelo R0 

#Parametres Phi's 
#phi_iv=phi_v1,

#NULL Nos permite tener valores diferentes en cada simulación
set.seed(NULL)

###### En este caso, se modifica la comunidad de hospederos y vectores de manera aleatoria

#Ciclos 
#Preferencias aleatorias
Nb_ciclos=1000*2

Matrix_R0=matrix(NA, nrow=Nb_ciclos, ncol=3)
colnames(Matrix_R0)=c("n","m", "R0")
## en este caso, 

for(ci. in 1:Nb_ciclos)
   {
   if(ci.%%2>0)
    {
    source("C:/Users/Yasiri/Desktop/Posdoc_Ben/Script_r_2024/01_parametres.R")
    source("C:/Users/Yasiri/Desktop/Posdoc_Ben/Script_r_2024/02_Matriz_lambda_pref_iguales.R")
    source("C:/Users/Yasiri/Desktop/Posdoc_Ben/Script_r_2024/03_NGM.R")
 
    }
    if(ci.%%2==0)
      {
      #Aquí tenemos las mismas especies de host, pero en menor número 
      Nhi_1=round(runif(m, 1,(Nhi-1)),0)
      Nhi=Nhi_1
      source("C:/Users/Yasiri/Desktop/Posdoc_Ben/Script_r_2024/03_NGM.R")
      }
  Matrix_R0[ci.,]=c(n,m, round(R0,2))
  } 


Matrix_ED=matrix(NA, Nb_ciclos/2,2)
#host R0_HM tiene más individuos que R0_Hm para cada especie 
colnames(Matrix_ED)=c("R0_Hm/R0_HM", "Efecto")

ciclos_nones=which((1:Nb_ciclos)%%2>0) 

c.indi=1
for(ci. in ciclos_nones)
  {
  if(Matrix_R0[ci.,3]>0 & Matrix_R0[ci.+1, 3]>0)
    {
    Matrix_ED[c.indi,1]=round(Matrix_R0[ci.+1,3]/Matrix_R0[ci.,3],2)
    if(Matrix_ED[c.indi,1]>1)
      {
      #Dilución=1
      Matrix_ED[c.indi,2]=1
      }
    if(Matrix_ED[c.indi,1]<1)
      {
      #Amplificación=-1
      Matrix_ED[c.indi,2]=-1
      }
    if(Matrix_ED[c.indi,1]==1)
      {
      #Neutro=0
      Matrix_ED[c.indi,2]=0
      }
    }
  c.indi=c.indi+1
  }
#con esta instrucción elimino las líneas con NA 

Lineas_NA=which(is.na(Matrix_ED[,1]))
Matrix_ED.omit=Matrix_ED[-Lineas_NA,]

#Para determinar los efectos  
Diluciones=length(which(Matrix_ED.omit[,2]==1))
Amplificaciones=length(which(Matrix_ED.omit==-1))
Neutro=length(which((Matrix_ED.omit==0)))
simulaciones_exitosas=Nb_ciclos/2-length(Lineas_NA)

Porcentaje_Ampli=100*Amplificaciones/simulaciones_exitosas
Porcentaje_Dilu=100*Diluciones/simulaciones_exitosas
Porcentaje_Neutro=100*Neutro/simulaciones_exitosas

Porcentaje_Ampli
Porcentaje_Dilu
Porcentaje_Neutro

#Histograma de frecuencias de los cocientes R0_Hm/R0_HM
Graph1=hist(Matrix_ED.omit[,1]) 

