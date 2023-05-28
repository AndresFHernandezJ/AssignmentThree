library(tidyverse)
library(caret)
library(gmodels)
#Load Model
NewknnFitAmbiente <- readRDS("knn_model.rds")
nuevos_datos1 <- PruebaNuevos
nuevos_datos1$ambiente <- factor(nuevos_datos1$ambiente, levels = c("UNO", "DOS", "TRES"))

#nuevos_datos <- read.csv("D:/Usr/Desktop/Andres/8vo Semestre/DataScience/AssignmentThree/Datasets/PruebaNuevos.csv")
predicciones1 <- predict(NewknnFitAmbiente, newdata = nuevos_datos1)


CrossTable(nuevos_datos1$ambiente, predicciones1, prop.chisq = FALSE)

