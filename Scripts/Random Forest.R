library(randomForest)

data.samples <- sample(1:nrow(Dataset1_norm),
                       nrow(Dataset1_norm) * 0.7, replace = FALSE)

training.dataA4<- Dataset1_norm[data.samples, ]

test.dataA4 <- Dataset1_norm[-data.samples, ]

Ambientefit.rf <- randomForest(ambiente ~ ultrasonico + fotorresistencia + color1 + color2 + color3
                               ,data = training.dataA4)

Aprediction.rf <- predict(Ambientefit.rf, test.dataA4)

output <- data.frame(test.dataA4$ambiente, Aprediction.rf)

table(test.dataA4$ambiente, Aprediction.rf)
