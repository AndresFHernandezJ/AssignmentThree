library(tidyverse)
library(caret)
library(gmodels)
#Load Model
NewLRfit <- readRDS("LR_model.rds")
nuevos_datos2_norm <- PruebaNuevos
nuevos_datos2_norm[, variables] <- scale(nuevos_datos2_norm[, variables])
nuevos_datos2_norm$ambiente <- factor(nuevos_datos2_norm$ambiente, levels = c("UNO", "DOS", "TRES"))

#nuevos_datos <- read.csv("D:/Usr/Desktop/Andres/8vo Semestre/DataScience/AssignmentThree/Datasets/PruebaNuevos.csv")
predicciones2 <- predict(NewLRfit, newdata = nuevos_datos2_norm)


CrossTable(nuevos_datos2_norm$ambiente, predicciones2, prop.chisq = FALSE)


