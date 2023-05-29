library(tidyverse)
library(caret)
library(gmodels)
library(rpart)
library(rpart.plot)
#Load Model
Newarbol_ambiente <- readRDS("DT_model.rds")
nuevos_datos3_norm <- PruebaNuevos
nuevos_datos3_norm[, variables] <- scale(nuevos_datos3_norm[, variables])
nuevos_datos3_norm$ambiente <- factor(nuevos_datos3_norm$ambiente, levels = c("UNO", "DOS", "TRES"))

#nuevos_datos <- read.csv("D:/Usr/Desktop/Andres/8vo Semestre/DataScience/AssignmentThree/Datasets/PruebaNuevos.csv")
predicciones3 <- predict(Newarbol_ambiente, newdata = nuevos_datos3_norm)


rpart.plot(Newarbol_ambiente, type = 1, extra = 104)
