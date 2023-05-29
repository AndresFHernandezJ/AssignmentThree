library(randomForest)
library(ROCR)
library(rpart.plot)
library(caret)

data.samples <- sample(1:nrow(Dataset1_norm),
                       nrow(Dataset1_norm) * 0.7,
                       replace = FALSE)

training.dataA4 <- Dataset1_norm[data.samples, ]
test.dataA4 <- Dataset1_norm[-data.samples, ]

RFfit.rf <- randomForest(ambiente ~ ultrasonico + fotorresistencia + color1 + color2 + color3,
                         data = training.dataA4)

Aprediction.rf <- predict(RFfit.rf, test.dataA4)

table(test.dataA4$ambiente, Aprediction.rf)

# Guardar el modelo
saveRDS(RFfit.rf, "RF_model.rds")


