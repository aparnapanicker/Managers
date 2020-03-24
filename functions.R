#Function edded to allow us to input a number or set of numbers
#The function should calculate the percentage value for each number
#reduce output to 1 decimal place, and display the "%" symbol as part of the answer
#function should then allow us to store the answer in a variable

add_percent <- function(my_number)
{
  # Multiply the number by 100 and only show 1 digit
  percent <- round(my_number * 100, digits = 1)
  result <- paste(percent, "%", sep = "")
  # Return the calculation
  return(result)
}

#Test the function
sample_vector <- c(0.458, 1.666, 0.8954)
add_percent(sample_vector)

#Function with one more argument as input
#Add another argument in the function which will 
#as the formula multiplier 
#Add another argument that will control the number of digits

add_argument <- function(my_number, multiplier = 100, number_of_digits = 1)
{
  # Multiply the number by 100 and only show 1 digit
  percent <- round(my_number * multiplier, digits = number_of_digits)
  result <- paste(percent, "%", sep = "")
  # Return the calculation
  return(result)
}
#Test the new adding argument function function
sample_vector <- c(0.458, 1.666, 0.8954)
add_argument(sample_vector,10, 2)
#Test after setting the default
sample_vector <- c(0.458, 1.666, 0.8954)
add_argument(sample_vector)

#Calculate the central tendency and spread of data object
my_stats <- function(values, parametric = TRUE, allow_print = FALSE)
{
  if (parametric) 
  {
    central_tendancy <- mean(values)
    spread <- sd(values)
  }
  else
  {
    central_tendancy <- median(values)
    spread <- mad(values)
  }
  if (allow_print == TRUE & parametric == TRUE)
  {
    #construct relevant output
    cat("Mean = ", central_tendancy, "\n", "SD = ", spread, "\n")
    result<- paste("Mean = ", central_tendancy, "\n", "SD = ", spread, "\n")
  }
  else if (allow_print & !parametric)
  {
    cat("Median = ", central_tendancy, "\n", "MAD =", spread, "\n")
  }
  return(result)
  
}
sample_vector <- c(0.458, 1.663, 0.8654)
result <- my_stats(sample_vector, FALSE, TRUE)
result


Dosage <- c(20, 30, 40, 45, 60)
DrugA <- c(16, 20, 27, 40, 60)
DrugB <- c(15, 18, 25, 31, 40)

drugs <- data.frame(Dosage, DrugA, DrugB)
str(drugs)
plot(drugs)

attach(drugs)
plot(Dosage, type = "o", col = "Blue")
?plot


# option "b" indicates that both  points and lines should be plotted
plot(Dosage, DrugA, type = "b")
?par

#par function - parameters of a graph
opar <- par(no.readonly = TRUE)
#lty = line type
#lwd = line width


#lty = 2 dashed line
#pch = 17 solid triangle 
par(lty= 2, pch = 17)
plot(Dosage, DrugA, type = "b")
par(opar)