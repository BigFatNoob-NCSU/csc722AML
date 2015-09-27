# Support Vector Machine Experiments
library("e1071")

train = read.csv("data/biodeg.csv", header = TRUE, sep = ";")
colnames(train) <- c(paste("x", lapply(c(1:41),toString), sep=""), "y")

# Experiment here with parameters
bioSVM = svm(y=train[,42], x=train[-42])
pred = fitted(bioSVM)
table(pred, train$y)
