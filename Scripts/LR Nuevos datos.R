library(tidyverse)
library(caret)
library(gmodels)
#Load Model
NewLRfit <- readRDS("LR_model.rds")#Llama al modelo guardado
nuevos_datos2_norm <- PruebaNuevos
nuevos_datos2_norm[, variables] <- scale(nuevos_datos2_norm[, variables]) #normalizacion Z-score
nuevos_datos2_norm$ambiente <- factor(nuevos_datos2_norm$ambiente, levels = c("UNO", "DOS", "TRES"))


predicciones2 <- predict(NewLRfit, newdata = nuevos_datos2_norm)


CrossTable(nuevos_datos2_norm$ambiente, predicciones2, prop.chisq = FALSE)


