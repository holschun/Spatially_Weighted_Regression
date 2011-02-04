ourfunction=function(i,numK,latt,long,y,x1,x2,D,inc1,inc2) {
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

      		if (inc1 == 1 & inc2 == 1)
        	 		lmreg <-lm(y~x1+x2,weights=w)

      		if (inc1 == 1 & inc2 == 0)
         			lmreg <- lm(y~x1, weights = w)

     			if (inc1 == 0 & inc2 == 1)
         			lmreg <- lm(y~x2, weights=w)

			result.bisq <- lmreg # run regression with weights
			#result.bisq <- lm(y~x1*inc1+x2*inc2,weights=w) # run regression with weights
			tempbetahat[j] <- result.bisq$coefficients[2] # keep track of the coefficient estimate
			tempstd[j] <- summary(result.bisq)$coefficients[2,2]	 # keep track the coefficient st error
			tempyhat[j] <- result.bisq$fitted.values[i] # keep track of the predicted value of y
			tempSi[j] <- lm.influence(result.bisq)$hat[as.character(i)] # the leverage value

		} # ends the loop for the given k
		output=matrix(c(tempyhat,tempbetahat,tempstd,tempSi),ncol=numK,byrow=TRUE)
		output
	}