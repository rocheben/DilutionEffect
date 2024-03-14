#Para construir la matriz lambda hivj

#Preferencias de alimentaci?n 
#Sin preferencias - todos los vectores tienen en mismo comportamtiento alimenticio


vec_pref=rep(0, m)
pref_m1=runif(1,0,1)

while(pref_m1==0)
  {
  pref_m1=runif(1,0,1)
  }
vec_pref[1]=pref_m1

if(m==2)
  {
  vec_pref[2]=1-vec_pref[1]
  }

if(m>2){
for(i in 2:m-1)
  {
  vec_pref[i]=runif(1, 0, 1-sum(vec_pref))
  while(vec_pref[i]==0) 
    {
    vec_pref[i]=runif(1, 0, sum(vec_pref))
    }
  }
vec_pref[m]=1-sum(vec_pref)
}

#sum(vec_pref)

lambda_hivj=matrix(NA, n, m )
matrix_prefs=matrix(NA, n, m )
matrix_lambda=matrix(NA, n, m)

for(col in 1:m)
  {
  matrix_prefs[,col]=vec_pref[col]
  }
  
for(linea in 1:n)
    {
    matrix_lambda[linea,]=bvj[linea]
    }
  
lambda_hivj=matrixcalc::hadamard.prod(matrix_prefs, matrix_lambda)

Var_prefs=var(vec_pref)
Var_lambda=var(c(lambda_hivj))
Var_lambda
