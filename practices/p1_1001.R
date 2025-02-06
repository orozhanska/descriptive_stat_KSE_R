# Exercise #1. Compute the result of 45+35−20 and save it 
# into variable res1. Then multiply it by 2 and save into res2.

# Solution:

res1 <- 45+35-20
res2 <- 2*res1
###

# Exercise #2. Create a variable called "weight" 
# and assign your weight in kilograms to it (not necessarily true)
# Then create variable "height" and assign height in meters. 
# Then divide weight by height squared and assign 
# to the variable bmi and show it in the console

weight <- 50
height <- 1.62
bmi <- weight/(height^2)
bmi

# Solution:

###

# Exercise #3. Check the definition of function round(). 
# What will the result of this function used for 6.8 be and why?
# What if it's 6.25? What if you'll specify 
# parameter digits equal to 1?

?round()
round(6.8)
round(6.25)
round(6.25, 1)

# Solution:

###

# Exercise #4. Try to use operator %% in arithmetic operations. 
# For example 52%%5. Check the answer. You may experiment with
# other numbers as well. Guess what this operator do and explain.

# Solution:

52%%5
52%/%5

###

# Exercise #5. What is the class of "5", "TRUE", F, six

# Solution:

class("5")
class("TRUE")
class(TRUE)
class(F)
class(six)

###

# Exercise #6. What should be the function instead of _____
# so the result is TRUE
# is.character(as.character(round(6.2)))

# Solution:

is.character(as.character(round(6.2)))

###

# Exercise #7. Show in console the result of c(1,2,3)
# Then show the result of 1:3. Check class of both.
# Explain why the result is different and what does it mean

# Solution:

c(1,2,3)
1:3
class(c(1,2,3))
class(1:3)


###

# Exercise #8. Create a vector named temp with 
# minimum temperature for each of the next 7 days
# taken from any website with temperature for Kyiv
# (for example from sinoptik.ua)

# Solution:

temp <- c(7.5, 2.8, 7, 8, 9.1, 6.7, 21)
temp
class(temp)

###

# Exercise #9. Take the square root (guess the function name) 
# of the sum of all elements of the vector temp. 

# Solution:

sqrt(sum(temp))

###

# Exercise #10. Take the second element of the vector temp and 
# multiply it by 5th element and then add the first. 

# Solution:
sol <- temp[2]*temp[5] +temp[1]
sol

2.8*9.1+7.5
###

# Exercise #11. Create a vector with names of week days 
# and save it in the vector called "weekdays"

# Solution:
weekdays <- c("monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday")
weekdays

###

# Exercise #12*. Make a "temp" to be named vector and put
# into names the "weekdays" vector, but note that you may
# want to reorder days. And do it without remaking weekdays. 
# You can achieve it by putting into the vector numbers
# the vector with numbers that resembles a correct order. 

# Solution:

new_order <- c(2, 1, 3, 4, 5, 6, 7)
names(temp) <- weekdays[new_order]
temp

###


# Exercise #13*. Try functions sort() and order() on temp.
# What is the conceptual difference between them? 
# In which cases you may want to use one or another? Discuss

temp
sort(temp)
order(temp)
rank(temp)


# Solution: 

###

# Exercise #14. You've got the code with worker ranks 
# vec1 <- c("Kateryna","Max","Vasyl","Taras","Yuliya","Vika")
# vec2 <- c(3,2,6,5,1,4)
# vec1[____(vec2)]
# What is the function that should be here to sort workers 
# by rank? What if the data is incomplete and you've lost Vika 
# and her place from the list, yet no changes for other ranks. 
# Recreate vectors and check whether the answer will change, 
# if so then explain why

# Solution:

vec1 <- c("Kateryna","Max","Vasyl","Taras","Yuliya","Vika")
vec2 <- c(3,2,6,5,1,4)
vec1[order(vec2)]
# ??????

###

# Exercise #15. Find the maximum, minimum and average values 
# for vector temp. 

# Solution:
max(temp)
temp
min(temp)
mean(temp)
?mean()
####temp##

# Exercise #16. Check the documentation for the seq() function
# Using seq() generate the sequence 4,8,12,16,20
# and save it into "seq1" variable. 
# Find an average of the "seq" vector

seq(from=4, to=20, by=4)
seq(from=4, to=20, length.out=5)
seq1 <- seq(from=4, to=20, along.with=c(1,2,3,4,5))

# Solution:
?seq

###

# Exercise #17. Check the documentation for the rev() function
# Use it on "seq1" vector and save into seq2. 

# Solution:

?rev
class(seq1)
seq2 <- rev(seq1)
seq2
###

# Exercise #18. Add seq1 to seq2 and then find average
# Now combine vectors seq1 and seq2 using function c()
# and save into seq. Check the average of seq. 
# Is it any different and why?

# Solution:
seq_sum <- seq1+seq2
seq_sum
mean(seq_sum)
seq <- c(seq1, seq2)
mean(seq)

###