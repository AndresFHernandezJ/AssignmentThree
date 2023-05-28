library(caret)
library(tidyverse)
library(gmodels)

Data.binary <- Dataset1
Data.binary$binary <- Dataset1[,"ambiente"]=="UNO"
Data.binary$binary <- as.numeric(Data.binary$binary)


sample.indexA22 <- sample(1:nrow(Data.binary)
                         ,nrow(Data.binary)*0.7
                         ,replace = F)
predictorsA <- c("ultrasonico", "fotorresistencia", "color1", "color2", "color3")
train.dataA22 <- Data.binary[sample.indexA22
                              ,c(predictorsA,"ambiente")
                              ,drop=F]
test.dataA2 <- Data.binary[-sample.indexA22
                             ,c(predictorsA,"ambiente")
                             ,drop=F]

Data.logistic <- glm(binary ~ ultrasonico + fotorresistencia + color1 + color2 + color3
                     ,data = Data.binary
                     ,family = "binomial")
Data.logistic

binary.predict <- predict(Data.logistic
                          ,newdata = test.dataA2
                          ,type = "response")
binary.predict



