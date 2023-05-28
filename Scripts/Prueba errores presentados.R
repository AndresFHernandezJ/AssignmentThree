library(tidyverse)
library(caret)
library(gmodels)
library(class)

Dprueba <- read.csv("D:/Usr/Desktop/Andres/8vo Semestre/DataScience/AssignmentThree/Datasets/DPrueba.csv")
Dprueba_df <- DPruebaU
Dprueba_df$ambiente <- factor(Dprueba_df$ambiente, levels = c("UNO", "DOS", "TRES"))
Dprueba_norm <- Dprueba_df
#Seleccion de variables a normalizar
variablesP <- c("fotorresistencia", "color1","color2","color3")
#normalizacion min-max
Dprueba_norm[, variablesP] <- scale(Dprueba_norm[, variablesP])
#######################################################################################
normalise <- function(x){
  return((x-min(x))/max(x)-min(x))
}
Normprueba <- Dprueba_df
standarprueba <- Dprueba_df
Normprueba$fotorresistencia <- normalise(Normprueba$fotorresistencia)
Normprueba$color1 <- normalise(Normprueba$color1)
Normprueba$color2 <- normalise(Normprueba$color2)
Normprueba$color3 <- normalise(Normprueba$color3)
#########################################################################################
#Asignacion niveles
Dprueba_df$ambiente <- factor(Dprueba_df$ambiente, levels = c("UNO", "DOS", "TRES"))

# resumen datos normalizados
head(Normprueba)

#index for random sampling
sample.indexP <- sample(1:nrow(Normprueba)
                        ,nrow(Normprueba)*0.7
                        ,replace = F)
k <- 5
predictorsP <- c("fotorresistencia", "color1","color2","color3")

train.dataP <- Normprueba[sample.indexP
                             ,c(predictorsP,"ambiente")
                             ,drop=F]

test.dataP <- Normprueba[-sample.indexP
                            ,c(predictorsP,"ambiente")
                            ,drop=F]
########################################
predictionsP <- knn(train = train.dataP[predictorsP]
                   ,test = test.dataP[predictorsP]
                   ,cl = train.dataP$ambiente
                   ,k = k)
#rendimiento
CrossTable(x = test.dataP$ambiente, y = predictionsP)

#####################################
##### Knn + Normalisation (min-max) #####
ctrl <- trainControl(method="repeatedcv", repeats = 10, p=0.7)
knnFitAmbienteP <- train(ambiente ~ ultrasonico+color1+color3
                        , data = train.dataP
                        , method = "knn"
                        , trControl = ctrl
                        , preProcess = c("range")
                        , tuneLength = 20)

#Output of kNN fit DESDE ACA
knnFitAmbienteP
#plot(knnFitAmbiente)

#Get predictions for the testing data
knnPredictP <- predict(knnFitAmbienteP, newdata = test.dataP)

#Get the confusion matrix to see accuracy value and other parameter values
confusionMatrix(knnPredictP, test.dataP$ambiente)

CrossTable(test.dataP$ambiente, knnPredictP, prop.chisq = FALSE)






saveRDS(knnFitAmbiente, "knn_model.rds")
saveRDS(test.dataA, "test_data.rds")
saveRDS(knnPredict, "knn_predict.rds")
