library(caret)
library(tidyverse)
library(gmodels)

Dataset1 <- read.csv("D:/Usr/Desktop/Andres/8vo Semestre/DataScience/AssignmentThree/Datasets/DATA_SET_3_SENSORES.csv")
Dataset1_df <- Dataset1
Dataset1_df$ambiente <- factor(Dataset1_df$ambiente, levels = c("UNO", "DOS", "TRES"))

head(Dataset1_norm)
sample.indexA2 <- sample(1:nrow(Dataset1_norm)
                        ,nrow(Dataset1_norm)*0.7
                        ,replace = F)

predictorsA2 <- c("ultrasonico", "fotorresistencia", "color1", "color2", "color3")

train.dataA2 <- Dataset1_norm[sample.indexA2
                           ,c(predictorsA,"ambiente")
                           ,drop=F]

test.dataA2 <- Dataset1_norm[-sample.indexA2
                          ,c(predictorsA,"ambiente")
                          ,drop=F]

#############################################################
fit.control <- trainControl(method = "repeatedcv"
                            ,number = 10, repeats = 20)

LRfit <- train(ambiente ~ ultrasonico + fotorresistencia + color1 + color2 + color3
                     ,data = train.dataA2
                     ,method = "multinom"
                     ,trControl = fit.control, trace = FALSE)

LRfit

LRPredict <- predict(LRfit, test.dataA2, type = "prob")
LRPredict
summary(LRfit)

saveRDS(LRfit, "LR_model.rds")
