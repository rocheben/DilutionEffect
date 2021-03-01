rm(list=ls());
nbSimuls=15000;
ratio=0;

for(i in 9233:nbSimuls){
	print(i);
	s=sprintf("simul%d.dat",i);
	data=read.table(s);
	m1=as.numeric(data[2]);
	n1=as.numeric(data[3]);
	#tau1=as.numeric(data[4:(m1+n1+3)])
	#N1=as.numeric(data[(m1+n1+4):((m1+n1)*2+3)])
	#sigma1=as.numeric(data[((m1+n1)*2+4):((m1+n1)*3+3)])
	Imax1=as.numeric(data[((m1+n1)*3+4)])
	index=((m1+n1)*3+5);
	#phi1=as.numeric(data[index:(index+(m1+n1)*(m1+n1)-1)]);
	index=index+(m1+n1)*(m1+n1);
	m2=as.numeric(data[index]);
	n2=as.numeric(data[index+1]);
	#tau2=as.numeric(data[(index+2):(index+1+(m2+n2))])
	#N2=as.numeric(data[(index+2+(m2+n2)):(index+1+(m2+n2)*2)])
	#sigma2=as.numeric(data[ (index+2+(m2+n2)*2) : (index+1+(m2+n2)*3) ])
	Imax2=as.numeric(data[ (index+2+(m2+n2)*3) ])
	#index=(index+3+(m2+n2)*3);
	#phi2=as.numeric(data[index:(index+(m2+n2)*(m2+n2)-1)]);
	ratio[i]=Imax1/Imax2;
}
