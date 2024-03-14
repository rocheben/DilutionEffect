#Para construir la matriz lambda hivj

#Preferencias de alimentaci?n 
#Sin preferencias - todos los vectores tienen en mismo comportamtiento alimentcios

pref_vj=1/m
lambda_hivj=matrix(NA, n, m )
for(linea in 1:n)
  {
  lambda_hivj[linea,]=bvj[linea]*pref_vj
  }
