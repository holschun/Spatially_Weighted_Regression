# This script contains data generating processes Y = trueB X1 + true B2 X2
# It contains a nested loop with N stands for the times in a loop, and i stands for each observation.


	############################### model1: linear influence - beta varies with latt linearly #############
	################## beta = m*latt + 1 - 5*m #############################################################
	################## so that E[beta] = 1, and SD(beta) = sqrt(25/3) m####################################

  minK <- matrix(-99, loops, 2)
	gcvK <- matrix(-99, loops, numK)
	scoreK <- matrix(-99, loops, numK)
	#NullRate <- matrix(-99, loops,numK)
	errorList <- list(c(1:2))
	betaHats <- list(matrix(-99,n,numK))
	stdHats <- list(matrix(-99,n,numK))
	deviation <- c(1:loops)

  trueB1 <- eval(parse(text=dgp1))
  trueB2 <- eval(parse(text=dgp2))


  start = Sys.time()
	for (N in 1:loops) {
		# create some matrices to hold temp data output (these are overwritten each time through the simulation)
		# Create a matrix to hold all of the lwr parameter estimates
		betahat <- matrix(-99,n,numK) # lwr parameter estimates for each observation in the dataset
		yhat <- matrix(-99,n,numK) # the predicted y values for each observation
		std <- matrix(-99,n,numK) # standard errors for the lwr parameter estimate for each observation
		Si <- matrix(-99,n,numK) # the leverage for each observation in the LWR estimation process (input into GCV calculation)



		# Generate our data with a varying coefficient on x

    error=rnorm(n,0,e)
		errorList[[N]] <- error
		y1=x1*trueB1+x2*trueB2+error # This makes the coefficient on x range from 0 to 2 across our latt range


		output.spatialvar=lapply(c(1:n),ourfunction,numK=numK,latt=latt,long=long,y=y1,x1=x1,x2=x2,D=D, inc1 = inc1, inc2 = inc2)

 ##Output Array..All we have here is output obtained by running over 1 loop !
		for (i in 1:n) {
			betahat[i,] <- output.spatialvar[[i]][2,]
			yhat[i,] <-  output.spatialvar[[i]][1,]
			std[i,] <- output.spatialvar[[i]][3,]
			Si[i,] <-  output.spatialvar[[i]][4,]
		}      ##loop ends here
		
# This loop only collects all the results from the lapply function.

		betaHats[[N]] <- betahat       ##Store all betahats matrices looping over N times
		stdHats[[N]] <- std
		v1 <- apply(Si,2,sum)
		SE <- apply((y1-yhat)^2,2,sum)
		GCV <- n*SE/(n-v1)^2           ##Define GCV score

# SCORE value
		SCORE <- c(1:length(kvector))
		for (i in 1:length(kvector)){
			SCORE[i]<-sum((betahat[,i]-trueB1)^2)
		}

		gcvK[N,]<-GCV
		scoreK[N,]<-SCORE
		#NullRate[N,]<- unlist(lapply(indList,addd,list1 = c(1:n),trueB=trueB1))

		minK[N,1]<-kvector[which.min(scoreK[N,])]
		minK[N,2]<-kvector[which.min(gcvK[N,])]
		#minK[N,3]<-NullRate[N,which.min(SCORE)]
		#minK[N,4]<-NullRate[N,which.min(GCV)]
	} #ends our N loop

