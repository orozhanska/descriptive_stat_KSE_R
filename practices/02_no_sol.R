# Exercise #1. You've got four expressions and two lines of code.
# Make both of them to be TRUE inputting instead _____ one of the expression
# 1) 23-39 = -16; 2) sqrt(16)-16 = -12 ; 3) 20-abs(-32) = -12 ; 4) -(4^2) = -16
# _____ == ______
# _____ == ______


23-39 == -(4^2)

sqrt(16)-16 == 20-abs(-32)


















# Solution:

###

# Exercise #2. Create a vector logic_vec containing logical values 
# for whether each number in 1:10 is even.

# Solution:
logic_vec <- (1:10) %% 2 == 0
logic_vec


###

# Exercise #3: Create a vector scores of 7 random numbers between -100 and 100.
# Use function runif() for this (check documentation if needed).
# Assign names to the vector using the days of the week (Monday, ..., Sunday).
# weekdays <- c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")
# Find and display all days where the score is more than -50.

# Solution:

?runif
random_vector <- runif(7, -100, 100)
weekdays_vec <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")


names(random_vector) <- weekdays_vec
random_vector

###

# Exercise #4: Combine two randomly created vectors vec1 and vec2 of equal length 
# into a new vector vec_sum. Check whether the sum of vec_sum matches 
# the sum of the individual vectors.

# Solution:

vec1 <- runif(7, -100, 100)
vec2 <- runif(7, -100, 100)
vec1 + vec2
vec_sum <- c(vec1, vec2)
sum(vec_sum) == sum(vec1) + sum(vec2)


###

# Exercise #5. You've got a vector with ages
# ages <- c(12, 25, 8, 34, 16, 40, 10, 21, 18, 30)
# Identify people who are adults (age 18 and above)
# is_adult <- ages ______ 18
# Identify teenagers (age between 13 and 19, inclusive)
# is_teenager <- (ages ______ 13) & (ages ______ 19) 
# Replace ages of non-adults with NA
# ages[______] <- NA  

# Solution: 
ages <- c(12, 25, 8, 34, 16, 40, 10, 21, 18, 30)
is_adult <- ages >= 18
is_adult
ages[is_adult]
ages[ages>=18]

is_teenager <- (ages >= 13) & (ages <= 19) 
is_teenager
ages[is_teenager]

ages[ages<18] <- NA # we cannot put the characters here as the vector has one data type
ages

1

###

# Exercise #6. Continue 
# Identify ages that are NA (you can do it with the function is.na())
# is_missing <- ______(ages)
# Replace missing values (NA) with the mean of the remaining ages
# ages[is_missing] <- ______(ages[!is_missing])  
# Logical vector: Identify people aged 30 and above
# is_senior <- ages ______ 30  
# Count the number of seniors
# num_seniors <- ______(is_senior)  

# Solution: 

is_missing <- is.na(ages)
is_missing

ages[is_missing] <- mean(ages[!is_missing])  
ages
is_senior <- ages >= 30  
ages[is_senior]

num_seniors <- sum(is_senior)
num_seniors

###

# Exercise #7: Check if variable x is NOT between 10 excluding and 20 including.
# Make x to be equal to 20, then to 15, then to 25

# Solution:
x1 <- 20
x2 <- 15
x3 <- 25
x1 <= 10 | x1 > 20
x2 <= 10 | x2 > 20
x3 <= 10 | x3 > 20


###

# Exercise #8: Use a logical vector to identify elements in vec1 that are 
# either equal or greater than their corresponding values in vec2. 
# Display these elements for vec1. Do it with a single line of code

# Solution:
vec1
vec2
vec1 >= vec2
sum(vec1)
###


# Exercise #9: Write an IF condition to check if the sum of elements in vec1 
# is positive. If so, print "Positive balance". Otherwise, 
# print "Negative balance".

# Solution:

if (sum(vec2) > 0) {
  "Be positive"
} else {
  "Be negative (a joke. POSITIVE THINKING IS *THE* KEY)"
}

if (-1 > 0) {
  "Be positive"
} else {
  "Be negative (a joke. POSITIVE THINKING IS *THE* KEY)"
}


###

# Exercise #10: Write an IF condition for a variable temperature. 
# If it's greater than 25, print "Hot". If it's between 10 and 25 (inclusive),
# a "Moderate". Otherwise, print "Cold".


# Solution:

temperature <- runif(1)
temperature

if (temperature > 25) {
  "Hot"
} else if (temperature >= 10) {
  "Moderate"
} else {
  "Cold"
}


###

# Exercise #11: Simulate a coin toss (1 for heads, 0 for tails). 
# Use ifelse() to assign "Win" for heads and "Lose" for tails 
# in a vector of 1000 random coin tosses.

# Solution:

sample_coins <- rbinom(1000, 1, 0.5)
ifelse(sample_coins == 1, "Win", "Lose")

mean(c(NA, 1))

###

# Exercise #12: Given a vector with BMI, create a new vector using 
# ifelse() to classify BMI as "Good" (less than 25), 
# "Moderate obesity" (25 to 35 including), or "Obesity" (more than 35).
bmi <- c(24.4,36.7,38.0,36.9,30.8,34.8,31.8,26.7,36.7,34.9,36.2,24.9,26.6,32.7,24.6,30.8,30.6,38.6,26.2,26.6)

# Solution:
ifelse(bmi < 25, "Good", ifelse(bmi > 35, "Obesity", "Moderate obesity"))

###

# Exercise #13: Create a 3x3 matrix with random numbers between 1 and 100 
# and save to "mat". 

# Solution:

mat <- matrix(runif(9), nrow = 3)
mat

###

# Exercise #14*: Replace all numbers greater than 50 with their half 
# using matrix indexing.

# Solution: 
mat[1,1] <- 100
mat[mat > 50] <- mat[mat > 50] / 2
mat


###

# Exercise #15: Create a named 2x3 matrix representing sales data for two products 
# across three months. Calculate the total sales for each month and each product.

# Solution:
sales <- matrix(c(1000, 1300, 2000, 20000, 100000, 3000000), nrow = 2, byrow = TRUE)
colnames(sales) <- c("June", "July", "August")
rownames(sales) <- c("Tea", "Coffee")
sales <- rbind(sales, colSums(sales))
sales <- cbind(sales, rowSums(sales))

sales

###

# Exercise #16: Create a 4x4 identity matrix. Use function diag() for this.
# Replace its diagonal with the numbers 1,4,9,16.

# Solution:
?diag()

imatrix <- diag(4)

diag(imatrix) <- c(1,4,9,16)

imatrix

###


# Exercise #17: Create a dataset with 5 tiktok users (rows) 
# and 3 weeks (columns) with amount of tiktoks watched.
# You may use runif again, if you'd like to.
# Make a single line of code to print in console the answer to:
# 1) The week with the highest total tiktoks watched.
# 2) The user with the highest average tiktoks watched per week.

# Solution:

dataset <- matrix(runif(15, 100, 100000), nrow = 5)
colnames(dataset) <- c("Week 1", "Week 2", "Week 3")
rownames(dataset) <- c("Nataly", "Olesia", "Nadia", "Sonya", "Dmytro")
dataset <- rbind(dataset, colSums(dataset))
dataset <- cbind(dataset, rowMeans(dataset))

rownames(dataset) <- c("Nataly", "Olesia", "Nadia", "Sonya", "Dmytro", "Total")
dataset

###
