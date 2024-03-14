#Para crear la NGM 
#la matriz tiene dimension nXn 
library("matrixcalc")
library("pracma")

##DESCOMPONEMOS LA MATRIZ OMEGA EN 3 MATRICES 

Omega_matrix_h=matrix(NA,m,n)
Omega_matrix_v=matrix(NA,m,n)

for(lin in 1:m){
  Omega_matrix_h[lin,]=nu[lin]/(Nhi[lin]*(dhi[lin]+nu[lin]))
}

for(col in 1:n){
  Omega_matrix_v[,col]=Tao_vj[col]  
}

Omega_matrix_lambda=t(lambda_hivj)

Omega_matrix=Omega_matrix_h*Omega_matrix_v*Omega_matrix_lambda


NGM=matrix(NA, n,n)
NGM_Nv=matrix(NA, n,n)
NGM_dv=matrix(NA, n,n)
NGM_Omega=matrix(NA, n,n)
NGM_Omega_phi=matrix(NA, n,n)

for(lin in 1:n)
{
  NGM_Nv[lin,]=Nvj[lin]
}

for(col in 1:n)
{
  NGM_dv[,col]=1/dvj[col]
}

Omega_matrix_t=t(Omega_matrix)
Phi_matrix=t(Omega_matrix_t)

for(col in 1:n){
  for(lin in 1:n)
  {
    NGM_Omega_phi[lin, col]=sum(Omega_matrix_t[lin]*Omega_matrix_lambda[col])
  }
}

NGM=NGM_Omega_phi*NGM_dv*NGM_Nv


if(is.complex(eigen(NGM)$values)==TRUE){
  R0=-1}
if(is.complex(eigen(NGM)$values)==FALSE){
  R0=max(eigen(NGM)$values)}
R0

