#Load the csv file Diabetes-md
my_data <- read.csv('Diabetes-md.csv')
# Creating a data frame 
my_data <- data.frame(my_data)
str(my_data)
class(my_data)
# To see the working directory
getwd()
my_data[!complete.cases(my_data),]
# Appears that some fileds have missing data that needs to be recoded
my_data$Address[my_data$Address == ""] <- NA
my_data$Daibetes.type[my_data$Daibetes.type == ""] <- NA
my_data$Status[my_data$Status == ""] <- NA
my_data[!complete.cases(my_data),]
#this still contains ""
#so first update we need to convert to char
#fisrt and then record to factor
str(my_data)
my_data$Daibetes.type <- as.character(my_data$Daibetes.type)
str(my_data)
#Then convert back to a factor
my_data$Daibetes.type <- as.factor(my_data$Daibetes.type)
str(my_data)
#convert address to character
my_data$Address <- as.character(my_data$Address)
#convert status to char -> factor
my_data$Status <- as.factor(my_data$Status)
str(my_data)
#dealing with missing data. How do we decide what to do
#Analysing the missing data
my_na <- my_data[!complete.cases(my_data),]
nrow(my_na)
library(mice)
md.pattern(my_data)
library(VIM)
missing_values <- aggr(my_data, prop = FALSE, numbers = TRUE)
summary(missing_values)
my_na <- my_data[!complete.cases(my_data$Diabetes.type, my_data$Status),]
my_na
nrow(my_na)
nrow(my_data)

full_data <- my_data[complete.cases(my_data$Diabetes.type, my_data$Status),]
nrow(full_data)

#alternative way to remove na from the data set
full_data <- my_data[!my_na]
dim(full_data)
nrow(full_data)

#configure type to an unordered factor
#refactor status
my_data$Status <- factor(my_data$Status, order = TRUE, levels = c("Poor", "Improved", "Excellent"))
str(my_data)

#5 
col_names <- c("Patient Name", "NI adress", "Type", "Age", "Health Status")
col_names (my_data) <- col_names
head(my_data, 10)

#6 
patient_names <- my_data[1:1]
head(patient_names, 10)
               


