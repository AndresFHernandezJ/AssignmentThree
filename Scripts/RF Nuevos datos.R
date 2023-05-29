library(randomForest)
#Load Model
NewRFfit <- readRDS("RF_model.rds")
nuevos_datos4_norm <- PruebaNuevos
nuevos_datos4_norm[, variables] <- scale(nuevos_datos4_norm[, variables])
nuevos_datos4_norm$ambiente <- factor(nuevos_datos4_norm$ambiente, levels = c("UNO", "DOS", "TRES"))

#nuevos_datos <- read.csv("D:/Usr/Desktop/Andres/8vo Semestre/DataScience/AssignmentThree/Datasets/PruebaNuevos.csv")
predicciones4 <- predict(NewRFfit, nuevos_datos4_norm)


table(nuevos_datos4_norm$ambiente, predicciones4)
