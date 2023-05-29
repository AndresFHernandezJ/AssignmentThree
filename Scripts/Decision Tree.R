library(rpart)
library(rpart.plot)

predictorsA3 <- c("ultrasonico", "fotorresistencia", "color1", "color2", "color3")
#index for random sampling
sample.indexA3 <- sample(1:nrow(Dataset1_norm)
                        ,nrow(Dataset1_norm)*0.7
                        ,replace = F)

train.dataA3 <- Dataset1_norm[sample.indexA3
                             ,c(predictorsA3,"ambiente")
                             ,drop=F]

test.dataA3 <- Dataset1_norm[-sample.indexA3
                            ,c(predictorsA3,"ambiente")
                            ,drop=F]

arbol_ambiente <- rpart(ambiente ~ ultrasonico+fotorresistencia+color1+color2+color3
                        ,data = train.dataA3)

rpart.plot(arbol_ambiente, type = 2, extra = 104)

saveRDS(arbol_ambiente, "DT_model.rds")
