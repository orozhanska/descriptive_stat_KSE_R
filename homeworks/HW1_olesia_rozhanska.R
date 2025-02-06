# hello

# Exercise #1: Fill the gaps and make the code to produce TRUE outputs.
# Uncomment the code and fill in the missing parts to make the code work

# num_var <- "42"
# char_var <- "Hello"
# log_var <- "FALSE"
# is.numeric(___(num_var))
# __.character(char_var)
# __.logical(___(log_var))

# Solution:

num_var <- "42"
char_var <- "Hello"
log_var <- "FALSE"

is.numeric(as.numeric(num_var))
is.character(char_var)
is.logical(as.logical(log_var))

###

# Exercise #2: Calculate the sum of squares for integers from 1 to 100.
# Uncomment the code and fill in the missing parts to make the code work
# ___ <- 1:100
# squared <- ___ ^ 2
# sum_squares <- ___(squared)
# print(sum_squares)

# Solution:

integers <- 1:100
squared <- integers ^ 2
sum_squares <- sum(squared)
print(sum_squares)
sum((1:100)^2)

###

# Exercise #3: Fix the syntax to create a vector and change the 3rd element to NA.
# Uncomment the code and fill in the missing parts to make the code work
# my_vector <- __(1, 3, 5, 7, 9)
# my_vector___ <- ___
# print(my_vector)

# Solution:

my_vector <- c(1, 3, 5, 7, 9)
my_vector[3] <- NA
print(my_vector)

###

# Exercise #4: Create a vector vec with 100 random integers between 1 and 100.
# Calculate the sum of all elements in vec and save it to sum1. 
# Then calculate the sum of all elements that are divisible by both 3 and 5
# and save it to sum2. Then replace these elements divisible by 3 or 5 
# with NA. Calculate the sum of the remaining values and save into sum3. 
# Check whether sum1 is equal to sum2 + sum3

# Solution:

vec <- runif(100, 1, 100) # not integer solution

vec <- sample(1:100, 100, replace = TRUE)
vec
sum1 <- sum(vec)

sum2 <- sum(vec[(vec %% 3 == 0) & (vec %% 5 == 0)])
sum2 

vec[(vec %% 3 == 0) | (vec %% 5 == 0)] <- NA
sum3 <- sum(vec[!is.na(vec)])
sum3

# sum2 + sum3 will be smaller than sum1. It happens because sum2 is not the sum of elements which are divisible
# by 3 OR 5, but of elements which are div by 3 AND 5.
# sum3 is the sum of el. "not divisible by 3 AND not divisible by 5", 
# when the complement to sum2 is sum of elements "not divisible by 3 OR not divisible by 5" 

sum2 + sum3 == sum1
sum2 + sum3 < sum1

# to equalize:

vec <- sample(1:100, 100, replace = TRUE)
vec
sum1 <- sum(vec)

sum2 <- sum(vec[(vec %% 3 == 0) & (vec %% 5 == 0)])
sum2 

vec[(vec %% 3 == 0) & (vec %% 5 == 0)] <- NA
sum3 <- sum(vec[!is.na(vec)])
sum3

sum2 + sum3 == sum1


###

# Exercise #5: Simulate a vector with ages of 50 people between 10 and 70.
# Identify people who are "minors" (under 18), "adults" (18–60), 
# and "seniors" (over 60) by creating a character vector age_group to classify 
# each age into one of these categories using ifelse(). 
# Calculate and print the percentage of each age group.

# Solution:

ages <- sample(10:70, 50, replace = TRUE)
age_group <- ifelse(ages < 18, "Minor", ifelse(ages > 60, "Senior", "Adult"))


for (x in c("Minor", "Adult", "Senior")) {
  percentage <- round(sum(age_group == x)/length(age_group), 4) * 100
  cat(percentage, "% are ", x, "\n")
}

###

# Exercise #6: Create a sequence seq1 of numbers from 1 to 500 with a step 5.
# Extract every 5th number from this sequence into a new vector seq2 (try to do 
# it in a smart way). Calculate the sum of these numbers, when each
# is multiplied by its index number in the new vector. Print the final sum.

# Solution:

seq1 <- seq(1, 500, 5)
seq2 <- seq1[seq(5, length(seq1), 5)]
indices <- 1:length(seq2)
print(sum(seq2*indices))

###

# Exercise #7: You have the following two vectors:
# names <- c("Anna", "John", "Maria", "Peter", "Sophia")
# scores <- c(56, 73, 89, 45, 90)
# Find the name of the person with the highest score.
# Remove the person with the lowest score from both vectors.
# Reorder the remaining people and scores in descending order of their scores.

# Solution:

names <- c("Anna", "John", "Maria", "Peter", "Sophia")
scores <- c(56, 73, 89, 45, 90)
names[which(scores == max(scores))]

names(scores) <- names
which(scores == max(scores))

lowest_score_ind <- which(scores == min(scores))
names <- names[-lowest_score_ind]
scores <- scores[-lowest_score_ind]

order <- order(scores, decreasing = T)
scores[order]
names[order]

###

# Exercise #8: Generate a vector vec with 20 random integers between -50 and 50.
# Create a new vector signs that contains "Positive" for positive numbers, 
# "Negative" for negative numbers, and "Zero" for zero values in vec.
# Replace all negative values (use signs to see which ones) in vec with their 
# absolute values. Calculate the product (using prod()) of all 
# non-zero elements (use signs to see which ones) in vec.

# Solution:

vec <- c(sample(-50:50, 19, replace = T), 0) # just so that we get at least one zero
signs <- ifelse(vec > 0, "Positive", ifelse(vec == 0, "Zero", "Negative"))
vec <- ifelse(signs == "Negative", abs(vec), vec)
prod(vec)
prod(vec[signs != "Zero"])

###

# Exercise #9: Create a vector vec with 30 random numbers between 1 and 100.
# Sort the numbers in descending order. Print the sum of all the elements 
# in the top half and the bottom half of the sorted vector, 
# then compare with the total sum divided by two.

# Solution:


vec <- sample(1:100, 30, replace = T)
vec <- sort(vec, decreasing = T)
mid <- floor(length(vec)/2) # added floor in case of uneven number of el-ts
upper_sum <- sum(vec[1:mid]) 
cat("The sum of upper-part elements is", upper_sum)

bottom_sum <- sum(vec[(mid+1):length(vec)])
cat("The sum of bottom-part elemets is", bottom_sum)

half <- sum(vec)/2

upper_sum > half & bottom_sum < half

###