# Exercise #1: Load responses.csv to df. Show the summary. 
# Then show all the column names and the first couple of rows. 
# Discuss about the dataset.

# Solution

df <- read.csv("responses.csv")
summary(df)
names(df)
head(df)


###

# Exercise #2. Give us a summary about Gender. 
# How to make it useful? What function should be used on df$Gender?
# Discuss why this variable may be useful in the research

# Solution

summary(df$Gender)
summary(factor(df$Gender))

###

# Exercise #3. Use summary() for spiders column.
# Try to interpret each result. Then make plots
# with plot() for both

# Solution

par(mfrow = c(1,1))
summary(df$Spiders)
plot(factor(df$Spiders))


###

# Exercise #4. Do the summary for spiders,
# but for different genders. Make plots as well.
# For this you may'd like to create a subset.
# Discuss the result.

# Solution
par(mfrow = c(1,2))
plot(factor(subset(df, subset= (df$Gender == "male"))$Spiders), main = "Spiders | Male")
plot(factor(subset(df, subset= (df$Gender == "female"))$Spiders),  main = "Spiders | Female")


###


# Exercise #6. Repeat for Height and then for Weight.
# Discuss results.

# Solution

par(mfrow = c(1,2))
hist(subset(df, subset= (df$Gender == "male"))$Height, main = "Height | Male")
hist(subset(df, subset= (df$Gender == "female"))$Height,  main = "Height | Female")

par(mfrow = c(1,2))

limit_low <- min(min(subset(df, subset= (df$Gender == "male"))$Weight, na.rm = T),
                 min(subset(df, subset= (df$Gender == "female"))$Weight, na.rm = T))

limit_high <- max(max(subset(df, subset= (df$Gender == "male"))$Weight, na.rm = T),
                 max(subset(df, subset= (df$Gender == "female"))$Weight, na.rm = T))

hist(subset(df, subset= (df$Gender == "male"))$Weight, main = "Weight | Male",  xlab = "Weight", xlim = c(limit_low,limit_high))
hist(subset(df, subset= (df$Gender == "female"))$Weight,  main = "Weight | Female", xlab = "Weight", xlim = c(limit_low, limit_high))


###

# Exercise #7: Calculate the proportion of respondents who love music (4-5).

# Solution: 

mean(df$Music >=4, na.rm = T)

###

# Exercise #8: Find how religious the youth is. Check variables 
# God and Religion, create a new variable Faith which is equal to the
# sum of God and Religion divided by 2, rounded to the bottom with floor()
# Check it with summary. Check the percentage of unreligious (1-2) people 
# who believe in God (4-5)

# Solution: 

df$faith <- floor((df$God + df$Religion)/2)
summary(df$faith)
mean((df$Religion <= 2 & df$God >= 4), na.rm = T)

###

# Exercise #9: Advanced summaries. You'd like to show all 
# mins, maxs, means and medians. For this you have to work
# with numeric columns only to avoid errors. 
# Using sapply and function is.integer() find all numeric
# columns. Then subset df with only those columns into df_num.

# Solution: 

for (col in colnames(df)){
  if (is.integer(df[,col])){
    cat("\n\n", col)
    
    min <- min(df[,col], na.rm = T)
    max <- max(df[,col], na.rm = T)
    mean <- mean(df[,col], na.rm = T)
    median <- median(df[,col], na.rm = T)
    
    cat("\nMin", min, "\nMax", max, "\nMean", mean, "\nMedian", median)
    
  }
}

numeric_cols <- sapply(df, is.numeric)

df_num <- df[, numeric_cols]

summary_stats <- data.frame(
  Min = sapply(df_num, min, na.rm = TRUE),
  Max = sapply(df_num, max, na.rm = TRUE),
  Mean = sapply(df_num, mean, na.rm = TRUE),
  Median = sapply(df_num, median, na.rm = TRUE)
)


print(summary_stats)

###

# Exercise #10*: Continue with df_num. Use sapply 
# with functions min/max/mean/median and na.rm=T
# and then explain the result.

# Solution: 

###