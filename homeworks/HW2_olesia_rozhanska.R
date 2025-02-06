### Instructions
# Each step is critical and may lead to have 0 if not done properly

# 1) Start a new session clicking Session -> New session above
# 2) All exercises have to be done in a new window (new session)
# and nothing else should be done in it
# 3) Write the solution after "# Solution:" comment and before "###"
# It should be the code that will do the exercise 
# and a comment if specified
# 4) When you're done, save the file as HWX_name_surname.R
# For example: HW1_Dmytro_Krukovets.R
# 5) Save the history of your work using save_history().
# For example: savehistory("HW1_Dmytro_Krukovets.Rhistory")
# 6) Send through Moodle both .R file and .Rhistory file


# Exercise #1: Create a vector grades with values: 
# "A", "B", "C", "A", "B", "C", "B", "A", "C","A", "B", "C", "A", "B", "C", "B", "A", "C", "A", "A", "C", "C", "A"
# Convert it into a factor with levels "A", "B", "C". 
# Then reorder the levels to be "C","A","B".
# Count how many times each grade appears, using *some* function

# Solution:

grades <- c("A", "B", "C", "A", "B", "C", "B", "A", "C","A", "B", "C", "A", "B", "C", "B", "A", "C", "A", "A", "C", "C", "A")

grades <- factor(grades, levels = c("A", "B", "C"), ordered = T)
grades

grades <- factor(grades, levels = c("C", "A", "B"), ordered = T)
grades

summary(grades)

#some experimenting for myself
table(grades)
ordered_levels <- names(sort(table(grades), decreasing = TRUE))

grades <- factor(grades, levels = c("A", "B", "C"))
grades

grades <- factor(grades, levels = ordered_levels, ordered = T)
grades



###

# Exercise #2: Load the built-in "airquality" dataset in R 
# into "airq". Display the first 6 rows, column names, and summary.
# Show rows where Ozone is greater than 50 and Temp is above 80. 
# Create a new column Heat_Index in the airquality dataset using 
# the formula: Heat_Index=Temp+(Humidity/100)×10
# Assume Humidity is derived from (100 - Wind) for simplicity.

# Solution:

data("airquality")
airq <- airquality
?airquality #Daily air quality measurements in New York, May to September 1973.

head(airq, 6)
names(airq)
summary(airq)

airq[(airq$Ozone > 50) & (airq$Temp > 80),] # is strange because of na's
airq[!is.na(airq$Ozone) & (airq$Ozone > 50) & (airq$Temp > 80),] 
airq[which((airq$Ozone > 50) & (airq$Temp > 80)), ]
subset(airq, subset = (airq$Ozone > 50) & (airq$Temp > 80))

airq$Humidity <- 100 - airq$Wind
airq$Heat_Index <- airq$Temp + (airq$Humidity/100)*10

airq[,c("Temp", "Wind","Humidity","Heat_Index")]


###

# Exercise #3: Write a function ozone_category() that takes 
# an Ozone value as input and returns:
# "Low" if Ozone < 30
# "Moderate" if 30 <= Ozone <= 60
# "High" if Ozone > 60
# Note that you need to check first whether there is an NA
# value with is.na() and return NA in this case.
# Apply this function to the Ozone column in the airquality 
# dataset to create a new column Ozone_Category.

# Solution:

ozone_category <- function(x){
  if (is.na(x)){
    return(NA)
  } else if (x < 30) {
    return("Low")
  } else if (x > 60) {
    return("High")
  } else {
    return("Moderate")
  }
}

sapply(c(1, 31, 61), ozone_category)

airq$Ozone_Category <- sapply(airq$Ozone, ozone_category)

airq[, c("Ozone_Category", "Ozone")]

###

# Exercise #4: Write a function extreme_weather() that takes Temp 
# and Wind as inputs, returns T if Temp > 90 and Wind < 5, F otherwise 
# (including if some variable is NA). Use it to identify all days with extreme 
# weather conditions in the airq dataset. Count how many such days exist.

# Solution:

extreme_weather <- function(temp, wind) {
  ifelse(!is.na(temp) & !is.na(wind) & temp > 90 & wind < 5, TRUE, FALSE)
}

extreme <- airq[extreme_weather(airq$Temp, airq$Wind),]

nrow(extreme)
nrow(extreme)/nrow(airq)

###

# Exercise #5: Write a function col_stats() that calculates 
# the mean, median, and standard deviation of a numeric column 
# in a data frame. Use this function on the Temp, Wind, and Ozone 
# columns of airquality. (Make sure to handle NA values appropriately.)

# Solution:

col_stats <- function(x, print_result = F){
  if (print_result == T){
    cat("\nMean:", mean(x, na.rm = T), "\nMedian:", median(x, na.rm = T), "\nStandard dev:", sd(x, na.rm = T), "\n")
  }
  
  return (c(mean(x,na.rm = T), median(x, na.rm = T), sd(x, na.rm = T)))
}


col_stats(airq$Ozone, print_result = T)
col_stats(airq$Temp, print_result = T)
col_stats(airq$Wind, print_result = T)


###

# Exercise #6: Replace all missing values in the Ozone column 
# with the column mean. (Hint: Use is.na() and mean() with na.rm = T)

# Solution:

summary(airq$Ozone[airq$Month == 5])
summary(airq$Ozone[airq$Month == 7]) # summer -> higher ozone
summary(airq$Ozone[airq$Month == 9])

#as we are covering different year seasons, I will replace NA's with data regarding a specific period

for (x in 5:9){
  airq[airq$Month == x & is.na(airq$Ozone), "Ozone"] <- mean(airq[airq$Month == x, "Ozone"], na.rm = T)
  cat("Changed NA in", x, "to", mean(airq[airq$Month == x, "Ozone"], na.rm = T), "\n")
}



###

# Exercise #7: Use a while loop to iterate through the Temp 
# column in the airquality dataset. 
# Count how many days have temperatures above 85 with a "count" assigned 0 before the while loop.

# Solution:

count <- 0
n <- 1

while (n <= nrow(airq)) {
  if (airq$Temp[n] > 85) {
    count <- count + 1
  }
  n <- n+1 
}

count


###

# Exercise #8: Rewrite the previous task using a for loop 
# instead of a while loop. Compare the results to ensure 
# they are the same.

# Solution:

count <- 0
n <- 1

for (n in 1:nrow(airq)) {
  if (airq$Temp[n] > 85) {
    count <- count + 1
  }
}

count


###

# Exercise #9: Custom Sorting
# Write a function sort_desc() that takes a numeric vector 
# as input and returns the vector sorted in descending order 
# without using the sort() function.
# (Hint: Use a WHILE loop and the max() function)

# Solution:
# here is a very stupid and simple solution


sort_desc <- function(x){
  
  sorted <- c()
  
  while (length(x[!is.na(x)]) > 0){
    
    max_value <- max(x, na.rm = T)
    sorted <- c(sorted, rep(max_value, sum(x==max_value, na.rm = T)))
    x[x==max_value] <- NA
  }
  
  return(sorted)
}

sort_desc(c(4, 6, 8, 1, 3, 1, 8))

###
savehistory("HW2_olesia_rozhanska.Rhistory")
