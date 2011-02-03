#This script contains variables that are randomly generated. One can think of putting these variable like
# together in a file that is like a dataset sheet.

  inc1 <- eval(parse(text=inc1)) # well specified and not well specified model
 	inc2 <- eval(parse(text=inc2)) #You can only write 1 or 0 as the two chocices for inc1 and inc2.

	latt=runif(n)*10 # give these observations latt and long coordinates
	long=runif(n)*10
	x1=runif(n)*10 # random x1's
	x2=runif(n)*10 # random x2's
	D<-list(c(1))
	for (i in 1:length(latt)){                                                                          `
		D[[i]]<-((latt-latt[i])^2+(long-long[i])^2)^.5 # calculate the distances
	}
	
	