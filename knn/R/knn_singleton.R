knn_singleton <- function(m1=0,m2=0,e=0,dgp1="1",dgp2="1",n=20,loops=5){
	kvector <- seq(5,n+1,by=5) # Create a vector of the different b parameters to check out
	kvector[length(kvector)] <- n-1
	numK <- length(kvector)

	# Create some containers to hold final output
	# the following matrices are used for recording the results.
	# minK has 4 c min SCORE', 'k for min GCV', 'min SCORE k keep Null Rate', 'min GCV k keep Null Rate'
	# the other 6 matrices have the same format; it keeps the min k for gcv/score on the 6th column, and records
	# 5 k's and the values associated with the k's to each direction of the min k.

	##################################################
	# A couple functions that are useful for the code
	###################################################
	
	ourfunction=function(i,numK,latt,long,y,x1,x2,D) {
		tempyhat=c(1:numK)
		tempbetahat=c(1:numK)
		tempstd=c(1:numK)
		tempSi=c(1:numK)
		Di<-D[[i]]
		for (j in 1:numK) { # j is the position of our k in the kvector
			k <- kvector[j]
			# calculate the bisquare weights
			b <- sort(Di)[k+1] # b is the threshold distance (distance to the k+1 th nearest observation to obs i)
			w <- (1-(Di/b)^2)^2
			w[Di>b]<-0

			result.bisq <- lm(y~x1+x2,weights=w) # run regression with weights
			tempbetahat[j] <- result.bisq$coefficients[2] # keep track of the coefficient estimate
			tempstd[j] <- summary(result.bisq)$coefficients[2,2]	 # keep track the coefficient st error
			tempyhat[j] <- result.bisq$fitted.values[i] # keep track of the predicted value of y
			tempSi[j] <- lm.influence(result.bisq)$hat[as.character(i)] # the leverage value

		} # ends the loop for the given k
		output=matrix(c(tempyhat,tempbetahat,tempstd,tempSi),ncol=numK,byrow=TRUE)
		output
	} # ends our function
	
	# a T-test function that is used by the nullRate function below
	ttest = function(i,j,trueB){
		t<-(betahat[i,j] - trueB[i])/std[i,j]
		if (2*pt(-abs(t),kvector[j]-2)>0.05){1} else {0};
	}

	gcvDeviation = function(scoreK,gcvK,loops){
		deviation<-c(1:loops)
		for (i in 1:loops){
			temp = scoreK[i,]/scoreK[i,which.min(scoreK[i,])]
			deviation[i]<- temp[which.min(gcvK[i,])] -1
		}
		deviation
	}
	
	## 'ind' is the index of the 'k' we want to test
	## list1 is the list of index of the n observations. (list1 = c(1:n).)
	## indList is the list of index of kvector. (indList = c(1:length(kvector)).)
	
	addd = function(ind,list1,trueB){
		sum(unlist(lapply(list1,ttest,j=ind,trueB=trueB)))/length(list1)
	}
	indList<-c(1:length(kvector))
	
	latt=runif(n)*10 # give these observations latt and long coordinates
	long=runif(n)*10
	x1=runif(n)*10 # random x1's
	x2=runif(n)*10 # random x2's
	D<-list(c(1))
	for (i in 1:length(latt)){
		D[[i]]<-((latt-latt[i])^2+(long-long[i])^2)^.5 # calculate the distances
	}

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
		# Create a matrix to hold all of the gwr parameter estimates
		betahat <- matrix(-99,n,numK) # lwr parameter estimates for each observation in the dataset
		yhat <- matrix(-99,n,numK) # the predicted y values for each observation
		std <- matrix(-99,n,numK) # standard errors for the lwr parameter estimate for each observation
		Si <- matrix(-99,n,numK) # the leverage for each observation in the LWR estimation process (input into GCV calculation)



		# Generate our data with a varying coefficient on x

		error=rnorm(n,0,e)
		errorList[[N]] <- error
		y1=x1*trueB1+x2*trueB2+error # This makes the coefficient on x range from 0 to 2 across our latt range

		# commented out because replaced by the "lapply" routine below
		#for (i in 1:n) { # i is the observation we are running the LWR for currently
		#output.spatialvar = vector("list", n)
		#for (i in 1:n) {
		#  output.spatialvar[i] <- ourfunction(i, numK, latt, long, y1, x1, D)
		#}

		output.spatialvar=lapply(c(1:n),ourfunction,numK=numK,latt=latt,long=long,y=y1,x1=x1,x2=x2,D=D)
		

		for (i in 1:n) {
			betahat[i,] <- output.spatialvar[[i]][2,]
			yhat[i,] <-  output.spatialvar[[i]][1,]
			std[i,] <- output.spatialvar[[i]][3,]
			Si[i,] <-  output.spatialvar[[i]][4,]
		}
		betaHats[[N]] <- betahat
		stdHats[[N]] <- std
		v1 <- apply(Si,2,sum)
		SE <- apply((y1-yhat)^2,2,sum)
		GCV <- n*SE/(n-v1)^2


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
	list(betahats = betaHats,stdhats = stdHats,gcv = gcvK,score = scoreK,minK = minK[,1:2], runtime = Sys.time() - start)
}
