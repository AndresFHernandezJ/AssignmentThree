library(psych)
library(ggplot2)
# Dataset load
Dataset1 <- read.csv("D:/Usr/Desktop/Andres/8vo Semestre/DataScience/AssignmentThree/Datasets/DATA_SET_3_SENSORES.csv")
#------------Pre-process your data (if required) and to perform an Exploratory Data Analysis.
# First rows of the dataset
head(Dataset1)

# Dataset Structure
str(Dataset1)

# Summary of the dataset
summary(Dataset1)

Dataset1_df <- Dataset1
Dataset1_df$ambiente <- factor(Dataset1_df$ambiente, levels = c("UNO", "DOS", "TRES"))

#Plot library psych RELACION ENTRE LAS VARIABLES PREDICTORAS
pairs.panels(Dataset1_df[, 1:5]
             ,main = "Sensor Data"
             ,pch = 21
             ,cex = 2
             ,bg = c("blue", "red", "green")[unclass(Dataset1_df$ambiente)])

par(mfrow = c(1, 1))
#Plots Variables predictoras vs objetivo
plot(Dataset1_df$ultrasonico, Dataset1_df$ambiente,
     main = "Gráfico de Dispersión: Sensor Ultrasónico vs Ambiente",
     xlab = "Sensor Ultrasónico", ylab = "Ambiente")

plot(Dataset1_df$fotorresistencia, Dataset1_df$ambiente,
     main = "Gráfico de Dispersión: Fotorresistencia vs Ambiente",
     xlab = "Sensor Ultrasónico", ylab = "Ambiente")

plot(Dataset1_df$color1, Dataset1_df$ambiente,
     main = "Gráfico de Dispersión: Color1 vs Ambiente",
     xlab = "Color1", ylab = "Ambiente")

plot(Dataset1_df$color2, Dataset1_df$ambiente,
     main = "Gráfico de Dispersión: Color2 vs Ambiente",
     xlab = "Color2", ylab = "Ambiente")

plot(Dataset1_df$color3, Dataset1_df$ambiente,
     main = "Gráfico de Dispersión: Color3 vs Ambiente",
     xlab = "Color3", ylab = "Ambiente")


# Dividir la ventana gráfica en una cuadrícula de 2 filas y 3 columnas
par(mfrow = c(2, 3))

# Histograma de Ultrasonico
hist(Dataset1_df$ultrasonico,
     main = "Histograma: Ultrasonico",
     xlab = "Ultrasonico")

# Histograma de Fotorresistencia
hist(Dataset1_df$fotorresistencia,
     main = "Histograma: Fotorresistencia",
     xlab = "Fotorresistencia")

# Histograma de Color1
hist(Dataset1_df$color1,
     main = "Histograma: Color1",
     xlab = "Color1")

# Histograma de Color2
hist(Dataset1_df$color2,
     main = "Histograma: Color2",
     xlab = "Color2")

# Histograma de Color3
hist(Dataset1_df$color3,
     main = "Histograma: Color3",
     xlab = "Color3")

par(mfrow = c(1, 1))

