library(tidyverse)
library(caret)
library(gmodels)
#Load Model
NewknnFitAmbiente <- readRDS("knn_model.rds")
nuevos_datos1_norm <- PruebaNuevos
nuevos_datos1_norm[, variables] <- scale(nuevos_datos1_norm[, variables])
nuevos_datos1_norm$ambiente <- factor(nuevos_datos1_norm$ambiente, levels = c("UNO", "DOS", "TRES"))

#nuevos_datos <- read.csv("D:/Usr/Desktop/Andres/8vo Semestre/DataScience/AssignmentThree/Datasets/PruebaNuevos.csv")
predicciones1 <- predict(NewknnFitAmbiente, newdata = nuevos_datos1_norm)


CrossTable(nuevos_datos1_norm$ambiente, predicciones1, prop.chisq = FALSE)
