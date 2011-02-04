knn <- function(m1=0,m2=0,e=0,dgp1="1",dgp2="1",n=20,loops=5){
	if (length(m1)!=length(m2)){
		print("The two 'm' vectors must have equal length!")
		return(-1)
	}else{
		output_i =c(0:0)
		for (i in 1:length(m1)){
			output_j = c(0:0)
			for (j in 1:length(e)){
				if (length(output_j)>1){
					output_j = list(output_j,knn_singleton(m1[i],m2[i],e[j],dgp1,dgp2,n,loops))
				}else{
					output_j = knn_singleton(m1[i],m2[i],e[j],dgp1,dgp2,n,loops)
				}
			}
			if (length(output_i)>1){
				output_i = list(output_i,output_j)
			}else{
				output_i = output_j
			}
		}
	}
	output_i
}