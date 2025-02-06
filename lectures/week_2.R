### Logic operators

# Comparison of logicals
TRUE == FALSE

# Comparison of numerics
-5*12!=27-131

# Comparison of character strings
"hello"=="helLo"

# Compare a logical with a numeric
TRUE == 1
FALSE == 0

### Return to vectors

vec1 <- c(140, -50, 20, -120, 240, 600, 380)
vec2 <- c(-24, -50, 100, -350, 10, 420, 110)
vec_days <- c("Monday", "Tuesday", "Wednesday", "Thursday",
              "Friday","Saturday","Sunday")
names(vec1) <- vec_days
names(vec2) <- vec_days

# Good days in terms of followers
vec1>20
vec1[vec1>20]



# Exercise. Show all catastrophe days with -40 
# and more decrease in followers for week 1.


#####

vec1 > vec2


# Check whether sum of elements in total_vec 
# equal to sum of sum_vec1 and sum_vec2 .

sum_vec1 <- sum(vec1)
sum_vec2 <- sum(vec2)
total_vec <- c(vec1,vec2)
sum(total_vec) == sum_vec1+sum_vec2



vec1_wednesday <- vec1[names(vec1)=="Wednesday"] 
vec1_wednesday
vec1["Wednesday"]
vec1_wednesday == vec1[3]
vec1_345 <- vec1[3:5]
vec1_123 <- vec1[c("Monday","Tuesday","Wednesday")]

### Operators & (AND), | (OR) and ! (NOT)

TRUE & TRUE
TRUE & FALSE
FALSE & TRUE
FALSE & FALSE

# Exercise. Check for yourself what will be if you repeat 
# the exercise with | instead of &. 


#####

!TRUE
!FALSE

first <- vec1[1]

# Is first under -100 or above 100?
first< -100 | first>100

# Is first between -100 (exclusive) and 100 (inclusive)?
-100 < first & first <= 100


### IF condition

vec1 <- c(140, -50, 20, -120, 240, 600, 380)
vec2 <- c(-24, -50, 100, -350, 10, 420, 110)
vec_days <- c("Monday", "Tuesday", "Wednesday", "Thursday",
              "Friday","Saturday","Sunday")
names(vec1) <- vec_days
names(vec2) <- vec_days

# Variables related to the last day of visits
week <- "week1"
num_follow <- 60

# Examine the IF statement for week
if (week == "week1") 
{
  print("Showing week 1 information")
}

# Exercise. Write the if statement for num_follow, 
# if it's more than 30, then print 
# "A lot of work have been done!".


#####

# Let's add "else" 
if (week== "week1") {
  print("Showing week 1 information")
} else {
  print("Unknown week")
}

# And try it for followers amount
if (num_follow > 30) {
  print("A lot of work have been done!")
} else {
  print("It's a bad day!")
}

# Let's add "else if"
if (week== "week1") {
  print("Showing week 1 information")
} else if (week== "week2") {
  print("Showing week 2 information")
} else {
  print("Unknown week")
}

# And try it for followers amount
if (num_follow > 30) {
  print("A lot of work have been done!")
} else if (0 < num_follow & num_follow <= 30) {
  print("Just a regular tiktok routine")
} else {
  print("It's a bad day!")
}

### ifelse() function

ifelse(vec1>30,"A lot of work have been done!","It's a bad day!")

# Exercise. Repeat for vec2, but if the amount of followers is 
# more than -20 then it'll be "Good", other way it's "Bad".


#####

### Matrix

rm(list=ls())

matrix(1:9)
matrix(1:9,nrow=3)
matrix(1:9,byrow=T,nrow=3)
matrix(1:9,byrow=T,nrow=2)

mat <- matrix(1:9,nrow=3)
mat[1,3]
mat[2,2]
mat[1,]
mat[,3]

# Social media coverage in Ukraine and Poland, mlns users

youtube <- c(26.7,27.2)
tiktok <- c(13.01,9.38)
insta <- c(11,11.15)

socnet_matrix <- matrix(c(youtube,tiktok,insta),nrow=3,byrow=T)
country <- c("Ukraine","Poland")
socnet <- c("Youtube", "TikTok", "Instagram")

socnet_matrix

colnames(socnet_matrix)

colnames(socnet_matrix) <- country
rownames(socnet_matrix) <- socnet

socnet_matrix

rowSums(socnet_matrix)
colSums(socnet_matrix)

cbind(mat,mat)
rbind(mat,mat)


socnet_wide <- cbind(socnet_matrix,rowSums(socnet_matrix))
socnet_wide <- rbind(socnet_wide,colSums(socnet_wide))
socnet_wide

socnet_wide <- rbind(socnet_matrix,colSums(socnet_matrix))
socnet_wide <- cbind(socnet_wide,rowSums(socnet_wide))
socnet_wide
