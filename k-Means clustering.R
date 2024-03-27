 #### Clustering ####
 ## k means ##
  ## unsupervised ml for grouping datasets into k groups ##
 # Idea, specify k, randomly select k and assaign each cluster.
 
data("USArrests")
help("USArrests") 

head(USArrests)

library(tidyverse)
library(DataExplorer)
create_report(USArrests)



Df<- scale(USArrests)
Df %>% 
  tail()


### k-means clustering.
library(factoextra)
fviz_nbclust(Df, kmeans, method = "wss")

 ### Model ###
K_means<-kmeans(Df, centers =4, nstart = 50 )
print(K_means)

K_means$centers
K_means$cluster




####
USA_Cluster<-cbind(USArrests, Cluster=K_means$cluster)
USA_Cluster %>% 
  sample_n(8)



fviz_cluster(K_means, data = Df,
             palette=c("#2E9FDF","#E7B800", "#00AFBB", "#FC4E07"),
             ellipse.type = "euclid",
             star.plot=T,
             repel = T)

fviz_cluster(K_means, data = Df,
             palette=c("blue", "green", "purple", "red"),
             ellipse.type = "euclid",
             star.plot=T,
             repel = T)


