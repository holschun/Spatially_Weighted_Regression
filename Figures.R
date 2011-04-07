install.packages("ggplot2")
library(ggplot2)


for(q in 1:length(m1))		#Selects a spatial variation
{
  for(p in 1: length(m2))
   {
  	for(w in 1:length(eselect))	#For all spatial Variatioins tests each error possibility
  		{
  		for(y in c(0,1))		#For each spatial variation and each error, tests correctly and misspecified models
  			{
                    temp = paste("LSV_m1", sprintf("%04d", m1[q] * 1000), "_m2", sprintf("%04d", m2[p] * 1000), "_e", eselect[w], "_y", y, ".Rdata", sep="")
                    load(temp)
                    myplot <- qplot(Kresults[[y + 1]]$minK[,2],Kresults[[y + 1]]$minK[,1], geom="bin2d", xlim=c(0,200),ylim=c(0,200),xlab='GCV',ylab='SCORE',main="")+ scale_fill_continuous(limits = c(0, loopset))
                    ggsave(myplot, filename = paste("../Image/",paste("LSV_m1", sprintf("%04d", m1[q] * 1000), "_m2", sprintf("%04d", m2[p] * 1000), "_e", eselect[w], "_y", y, ".png", sep="")))
                    dev.off()
			}
             }
     }
}