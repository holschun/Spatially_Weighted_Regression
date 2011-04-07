

# Set the working directory to the SWR folder
  setwd("E:/Aaron_Work/Spatially_Weighted_Regression/knn")
# source the requisite R functions
  source("E:/Aaron_Work/Spatially_Weighted_Regression/Package/singleton_revised.R")

m1 = c(0.2)	                # Specify a new list of m1 and m2 parameters 
m2 = c(0.2)
eselect = c(0.5)	                                # Specify a new list of error terms 
loopset = 10			                                        # Define the number of Looping in knn_singleton
houses = 20			                                        #n in knn_singleton


Kresults=list()			#list that will store the calculated K for each loop for each combination of m1+e
RunParameters=list()		#list that will store the parameters used for each run


for(q in 1:length(m1))		#Selects a spatial variation
	{
  for(p in 1: length(m2))
    {
  	for(w in 1:length(eselect))	#For all spatial Variatioins tests each error possibility
  		{
  		for(y in c(0,1))		#For each spatial variation and each error, tests correctly and misspecified models
  			{	
  
  				# My variables defined might not be correct (especially dgp1). 
  				# You should check to make sure I indluded everything
  
  			Kresults[[((q-1)*(p-1)*length(eselect)+(w-1)*2+y+1)]] = knn_singleton(n=houses, loops=loopset, e=eselect[w], dgp1="m1[q]*latt/4 + 1 - 5*m1[q]", dgp2="m2[p]*5 + 1 - m2[p]*long", inc1=1, inc2="y") 
  			RunParameters[[((q-1)*(p-1)*length(eselect)+(w-1)*2+y+1)]]=c(m1[q], m2[p], eselect[w], y, loopset, houses)
          
  				#This stores each iteration's K values and the parameters used. The 
  				#values in the [] just define which list item each step of the loop
  				#needs to populate to. Also, I am not sure if K is the vector of selected bandwidths
  				# from knn_singleton, so you should change that to whatever it should be.
                  filename = paste("LSV_m1", sprintf("%04d", m1[q] * 1000), "_m2", sprintf("%04d", m2[p] * 1000), "_e", eselect[w], "_y", y, ".Rdata", sep="")
                  save.image(paste("../Data/", filename))

        }
			}
		}
	}






