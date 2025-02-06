# How to code

# Option #1: write in the console, press "enter"
# Option #2: write in the file, put cursor in the line, 
# press "ctrl"+"enter"

"Hello world"
2

# Basic calculus

2+2
6-3
5*4
24/4 
27/4 
27%%4 # remainder of division
4^3 # it's 4*4*4


# Exercise. Do some math by yourself
# 36 divided by 6 multiplied by 8, 
# What if you'll take 6 by 8 into parentheses


#####

# Assignment of some value to variable
# You can store this value, rewrite if needed and use
x <- 13
x
y <- 4
y
x/y
13/4

some_text_you_can_write_whatever_you_would_like <- 42
some_text_you_can_write_whatever_you_would_like

# Names should be meaningful
# "infl" is for inflation
# "aqi" is for Air Quality Index
# "apt_price" is for apartments price


# Exercise. Create a variable for your height
# and put your heigth in cm into it

height_cm <- 163
height_cm

A <- rbinom(100000, 1, 0.4)
B <- rbinom(100000, 1, 0.2)


### Vector

num_vec <- c(4,5,6) # c() is combine, few elements to vector
char_vec <- c("a", "b", "c")
bool_vec <- c(TRUE,FALSE,F)

num_vec[2]
char_vec[3]


# Let's make vectors with amount of 
# new tiktok followers per day
vec1 <- c(140, -50, 20, -120, 240, 600, 380)
vec2 <- c(-24, -50, 100, -350, 10, 420, 110)

c(vec1,vec2)

vec_days <- c("Monday", "Tuesday", "Wednesday", "Thursday",
              "Friday","Saturday","Sunday")
names(vec1) <- vec_days

# Exercise. Do the same for another vector


#####

total_vec <- vec1 + vec2
total_vec
sum_vec1 <- sum(vec1)
sum_vec1

# Exercise. Create sum_vec2 like sum_vec1, but for vec2


#####
