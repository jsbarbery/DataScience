install.packages('SimDesign')
library(SimDesign)

actual_temp <- c(68.3,70,72.4,72,72,67,65)
predicted_temp <- c(68,67,72,70,67,65,67)
bias(actual_temp,predicted_temp)


actual_sales<- c(150,203,137,247,116,287)
predicted_sales <- c(200,300,150,200,150,300)
bias(actual_sales,predicted_sales)