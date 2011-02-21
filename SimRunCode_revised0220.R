#########################################
#					#
#	 Simulation Set-Up Code		#
#					#
#########################################

# Set the working directory to the SWR folder
  setwd("C:/Users/Daisy Sun/Desktop/knn")
# source the requisite R functions
  source("Package/singleton_revised.R")

#################################
# Define Parameters of Interest #
#################################

#These are just arbitrary numbers filled in below. Insert the ones you think are important to Run



m1 = c(0.1, 0.075, 0.05, 0.2, 0.25, 0.35, 0.5, 0.75)	                # Specify a new list of m1 and m2 parameters 
m2 = c(0.1, 0.075, 0.05, 0.2, 0.25, 0.35, 0.5, 0.75)
eselect = c(0.5, 0.75, 0.1, 1.5, 2, 3)	                                # Specify a new list of error terms 
loopset = 2			                                        # Define the number of Looping in knn_singleton
houses = 50			                                        #n in knn_singleton


Kresults=list()			#list that will store the calculated K for each loop for each combination of m1+e
RunParameters=list()		#list that will store the parameters used for each run


for(q in 1:length(m1))		#Selects a spatial variation
	{
	for(w in 1:length(eselect))	#For all spatial Variatioins tests each error possibility
		{
		for(y in c(0,1))		#For each spatial variation and each error, tests correctly and misspecified models
			{	

				# My variables defined might not be correct (especially dgp1). 
				# You should check to make sure I indluded everything

			Kresults[[((q-1)*length(eselect)+(w-1)*2+y+1)]] = knn_singleton(n=houses, loops=loopset, e=eselect[w], dgp1="m1[q]*latt/4 + 1 - 5*m1[q]", dgp2="1", inc1=1, inc2="y") 
			RunParameters[[((q-1)*length(eselect)+(w-1)*2+y+1)]]=c(m1[q], eselect[w], y, loopset, houses)
        
				#This stores each iteration's K values and the parameters used. The 
				#values in the [] just define which list item each step of the loop
				#needs to populate to. Also, I am not sure if K is the vector of selected bandwidths
				# from knn_singleton, so you should change that to whatever it should be.
                        filename = paste("LSV_m1", m1[q], "_e", e[w], "v", ".Rdata", sep="")
                        save.image(filename)
			}
		}
	}


# 













