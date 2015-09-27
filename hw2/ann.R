# Artificial Neural Networks Experiments
library("neuralnet")

train = read.csv("data/biodeg.csv", header = TRUE, sep = ";")
colnames(train) <- c(paste("x", lapply(c(1:41),toString), sep=""), "y")
#Convert class to numbers
train$y=sapply(train$y, function(x) if(x=="RB") 1 else 2)

lhs = tail(colnames(train), n=1)
rhs = paste(head(colnames(train), n=-1), collapse = "+")
formula = paste(lhs,rhs, sep = "~")

# Experiment with parameters here

bioNet = neuralnet(as.formula(formula), train, hidden = 10, linear.output = FALSE, stepmax = 1e6)
plot(bioNet, rep="best")