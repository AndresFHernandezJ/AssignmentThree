library(tidyverse)
library(caret)
library(gmodels)

Dataset1 <- read.csv("D:/Usr/Desktop/Andres/8vo Semestre/DataScience/AssignmentThree/Datasets/DATA_SET_3_SENSORES.csv")
Dataset1_df <- Dataset1
Dataset1_df$ambiente <- factor(Dataset1_df$ambiente, levels = c("UNO", "DOS", "TRES"))
Dataset1_norm <- Dataset1_df
#Seleccion de variables a normalizar
variables <- c("ultrasonico", "fotorresistencia", "color1", "color2", "color3")
#normalizacion min-max
Dataset1_norm[, variables] <- scale(Dataset1_norm[, variables])
#Asignacion niveles
Dataset1_norm$ambiente <- factor(Dataset1_norm$ambiente, levels = c("UNO", "DOS", "TRES"))

# resumen datos normalizados
head(Dataset1_norm)

#index for random sampling
sample.indexA <- sample(1:nrow(Dataset1_norm)
                       ,nrow(Dataset1_norm)*0.7
                       ,replace = F)

predictorsA <- c("ultrasonico", "fotorresistencia", "color1", "color2", "color3")

train.dataA <- Dataset1_norm[sample.indexA
                        ,c(predictorsA,"ambiente")
                        ,drop=F]

test.dataA <- Dataset1_norm[-sample.indexA
                        ,c(predictorsA,"ambiente")
                        ,drop=F]

##### Knn + Normalisation (min-max) #####
ctrl <- trainControl(method="cv", number = 20, p=0.7)
knnFitAmbiente <- train(ambiente ~ ultrasonico+fotorresistencia+color1+color2+color3
                , data = train.dataA
                , method = "knn"
                , trControl = ctrl
                , preProcess = c("scale")
                , tuneLength = 20)

#Output of kNN fit DESDE ACA
knnFitAmbiente
#plot(knnFitAmbiente)

#Get predictions for the testing data
knnPredict <- predict(knnFitAmbiente, newdata = test.dataA)

#Get the confusion matrix to see accuracy value and other parameter values
confusionMatrix(knnPredict, test.dataA$ambiente)

CrossTable(test.dataA$ambiente, knnPredict, prop.chisq = FALSE)


saveRDS(knnFitAmbiente, "knn_model.rds")
saveRDS(test.dataA, "test_data.rds")
saveRDS(knnPredict, "knn_predict.rds")


