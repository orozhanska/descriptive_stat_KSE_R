# Exercise #1: Create a vector "vec" for outfit ratings: 
# "Casual", "Drip", "Drip", "Casual", "Drip", "Slay", 
# "Drip", "Slay", "Casual", "Drip", "Casual", "Slay". 
# Convert it into a factor "fact" with levels "Casual", "Drip", "Slay".

# Solution:

vec <- c("Casual", "Drip", "Drip", "Casual", "Drip", "Slay",
         "Drip", "Slay", "Casual", "Drip", "Casual", "Slay")

fact <- factor(vec, levels = c("Casual", "Drip", "Slay"), ordered  = FALSE)
fact

###

# Exercise #2: Replace the levels "Casual", "Drip", "Slay"
# with "C", "D", "S" in the factor you created previously.

# Solution:

levels(fact) <- c("C", "D", "S")
fact

###

# Exercise #3*: Add a new factor level "Cringe" to the factor you created 
# previously and add two elements "Cringe" in the end
# For this you need to recreate fact as.character, combine with 2 "Cringe"s
# and put in levels the levels of previously created fact
# Do the addition of elements in a single line of code. 

# Solution:

vec <- c("Casual", "Drip", "Drip", "Casual", "Drip", "Slay",
         "Drip", "Slay", "Casual", "Drip", "Casual", "Slay")

fact <- factor(vec, levels = c("Casual", "Drip", "Slay"), ordered  = FALSE)

fact <- factor(c(as.character(fact), "Cringe", "Cringe"), levels = c("Casual", "Drip", "Slay", "Cringe"))
fact

###

# Exercise #4. Rename only "Cringe" level of the factor to "Cr"

# Solution:

levels(fact)[levels(fact) == "Cringe"] <- "Cr"

fact


###

# Exercise #5: Generate a summary of the factor you created previously.

# Solution:
fact

summary(fact)

###

# Exercise #6: Simulate a coin toss (1 for heads, 0 for tails). 
# Use ifelse() to assign "Win" for heads and "Lose" for tails 
# in a vector of 1000 random coin tosses.
# Make it factor and then show the summary

# Solution:

coin_tosses <- rbinom(1000, 1, 0.5)

coin_tosses <- ifelse(coin_tosses == 1, "Win", "Lose")
coin_tosses <- factor(coin_tosses)
coin_tosses
summary(coin_tosses)


###

# Exercise #7: Create a data frame "city_ua" with the following vectors:
# City: "Kyiv", "Lviv", "Odesa", "Kharkiv", "Dnipro"
# Population (millions): 2.9, 0.7, 1.0, 1.4, 1.0
# Subway: TRUE, FALSE, FALSE, TRUE, TRUE
# Extract the Population of "Odesa" in a matrix style.

# Solution:

city <- c("Kyiv", "Lviv", "Odesa", "Kharkiv", "Dnipro")
population <- c(2.9, 0.7, 1.0, 1.4, 1.0)
subway <- c(TRUE, FALSE, FALSE, TRUE, TRUE)

df <- data.frame(city, population, subway)

df[3, 2]

###

# Exercise #8: Extract all the rows where the population is greater than 
# 1 million. Do it both in data.frame style and in matrix style.

# Solution:

df[df$population > 1.0, ]
subset(df, subset = df$population > 1)
df[df[, 2] >1, ]


###

# Exercise #9: Create a subset of cities that do not have metro systems.
# Do it in both data frame style and matrix style. 
# To make things funnier, in your line of code don't use TRUE, T, FALSE, F :)

# Solution:

df[df$subway == 0, ]
subset(df, subset = (df$subway == 0))
df[df[, 3] == 0, ]

###

# Exercise #10*: Add a new column to the data frame 
# indicating whether the city is located in Eastern Ukraine 
# (TRUE for "Kharkiv" and "Dnipro", FALSE otherwise).
# Try the solution without and with the operator %in% to check how it works.
# Example of how %in% works: vec %in% ("Cringe","Slay") will give 
# a logical vector indicating elements that are either "Cringe" or "Slay"

# Solution:

df$is_eastern_ukraine <- (df$city=="Kharkiv")|(df$city=="Dnipro")
df

df$is_eastern_ukraine <- NULL
df

df$is_eastern_ukraine <- df$city %in% c("Kharkiv", "Dnipro")
df

###

# Exercise #11: Calculate the mean population of cities that have metro systems.

# Solution:

mean(df[df$subway == 1, "population"])
mean(subset(df, subset = (df$subway == 1))[, 2])

###

# Exercise #12: Load the diabetes.csv into diab and 
# print the summary of the data. Discuss.

# Solution:

diab <- read.csv('diabetes.csv')
diab

###

# Exercise #13: Do the following actions with a line of code for each:
# 1) Find the mean of the BMI column in the dataset.
# 2) Select all rows where the Age is greater than 50.
# 3) Select all patients with Age more than 50 and diabetes


# Solution:

mean(diab$BMI)
diab[diab$Age > 50, ]
diab[diab$Age > 50 & diab$Outcome == 1, ]

###

# Exercise #14: Create a new factor column "bmi_level" in the dataset that indicates
# whether the BMI is greater than 25 (label as "High BMI" or "Normal BMI").

# Solution:

diab$bmi_level <- factor(ifelse(diab$BMI > 25, "High BMI", "Normal BMI"))
levels(diab$bmi_level)


###

# Exercise #15. In diabetes dataset compare average BMI
# of those who have diabetes and those who aren't

# Solution:

diab_bmi <- mean(diab[diab$Outcome == 1, "BMI"])
diab_bmi

no_diab_bmi <- mean(diab[diab$Outcome == 0, "BMI"])
no_diab_bmi

###

# Exercise #16. Create sorted diabetes by increasing BMI, 
# check average Outcome in the first half 
# and in the second half of the dataset. Explain the result.

# Solution:

diabetes_sorted <- diab[order(diab$BMI), ]

# Find the midpoint of the dataset
midpoint <- floor(nrow(diabetes_sorted) / 2)

# First half
first_half <- diabetes_sorted[1:midpoint, ]

# Second half
second_half <- diabetes_sorted[(midpoint + 1):nrow(diabetes_sorted), ]

# Average Outcome in each half
avg_outcome_first_half <- mean(first_half$Outcome, na.rm = TRUE)
avg_outcome_second_half <- mean(second_half$Outcome, na.rm = TRUE)

# Print results
cat("Average Outcome in the first half:", avg_outcome_first_half, "\n")
cat("Average Outcome in the second half:", avg_outcome_second_half, "\n")

###

# Exercise 17: Create a while loop where i starts at 26. 
# Print the "i is not divisible by 11" (where i is a current number) 
# in each iteration and stop if the square is divisible by 11.
# After the loop print "i is divisible by 11" using final "i".
# You may want to use paste0() function in this task

# Solution:

i <- 26
while (i^2 %% 11 != 0) {
  print(paste(i, "squared is not divisible by 11"))
  i <- i+1
}
print(paste(i, "squared is divisible by 11"))

###


# Exercise #18. Create your own dataframe with students that attend these seminars.
# You need at least 7 students. Then you need columns:
# Name (up to you), Exam I score, Exam II score and put some grades from 0 to 20
# Then create column "passed", factor with values "y" or "n".
# Fill it if total grade is >=30 with "y","n" is otherwise.
# Reorder dataset from top student to "not that top" by exam II
# Also calculate mean and max score for exam I. 
# Show student names who has top grade in each exam and overall.
# Adjust dataset values in a way to have three different students in output :)

# Solution:

###