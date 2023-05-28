library(rpart)
library(rpart.plot)

fit <- rpart(ambiente ~ ultrasonico + fotorresistencia + color1 + color2 + color3
             , method = "class"
             , data = Dataset1_norm)

plot(fit, uniform = T, margin = 0.10)
text(fit, use.n = T, all = T, cex=0.8)
rpart.plot::rpart.plot(fit, shadow.col = "gray")
fit$cptable

#podar arbol
fit.pruned <- prune(fit
                    , cp = fit$cptable[which.min(fit$cptable[,"xerror"]),"CP"])

rpart.plot::rpart.plot(fit.pruned)
################################################################################################
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
