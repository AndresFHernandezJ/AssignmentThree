library(tidyverse)
library(caret)
library(gmodels)
#Load Model
LRAmbienteFit <- readRDS("LR_model.rds")
nuevos_datos2 <- PruebaNuevos
nuevos_datos2$ambiente <- factor(nuevos_datos2$ambiente, levels = c("UNO", "DOS", "TRES"))

#nuevos_datos <- read.csv("D:/Usr/Desktop/Andres/8vo Semestre/DataScience/AssignmentThree/Datasets/PruebaNuevos.csv")
predicciones2 <- predict(LRAmbienteFit, newdata = nuevos_datos2)


CrossTable(nuevos_datos2$ambiente, predicciones2, prop.chisq = FALSE)
