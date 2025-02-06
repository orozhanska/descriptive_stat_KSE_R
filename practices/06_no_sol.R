# Exercise #1: Load responses in df and use IQR Rule for Weight and Height,
# but don't rewrite anything. You can save df$Weight into wght
# first, same for df$Height. Discuss the result.

# Solution: 

df <- read.csv("responses.csv")
df
###

# Exercise #2. For wght, fill NA with mean value. Tip: you may use round() 
# for mean to be integer like every other observation.

# Solution:

wght <- df$Weight
hght <- df$Height
wght[wght> quantile(wght, 0.75, na.rm = T) + 1.5*IQR(wght, na.rm=T)]
wght[wght< quantile(wght, 0.25, na.rm = T) - 1.5*IQR(wght, na.rm=T)]
hght[hght> quantile(hght, 0.75, na.rm = T) + 1.5*IQR(hght, na.rm=T)]
hght[hght< quantile(hght, 0.25, na.rm = T) - 1.5*IQR(hght, na.rm=T)]

###

# Exercise #3. Save gender into factor. Repeat for hght the NA filling, 
# but do it according to the gender. Is there anything wrong?

# Solution:

wght <- ifelse (is.na(wght),
                round(mean(wght, na.rm=T),0), df$Weight)


gender <- factor(df$Gender)
hght[gender=="male"] <- ifelse(is.na(hght[gender=="male"]),
                               round(mean(hght[gender=="male"],na.rm=T),0),
                               hght[gender=="male"])
hght[gender=="female"] <- ifelse(is.na(hght[gender=="female"]),
                                 round(mean(hght[gender=="female"],na.rm=T),0),
                                 hght[gender=="female"])
summary(hght)

hght <- ifelse(is.na(hght),round(mean(hght,na.rm=T),0), hght)
summary(hght)


###

# Exercise #4: Find anomalies in wght using the IQR Rule.
# This time rewrite wght anomalies with the mean.

# Solution:


wght <- df$Weight
q1 <- quantile(wght, 0.25, na.rm = TRUE)
q3 <- quantile(wght, 0.75, na.rm = TRUE)
iqr <- q3 - q1
lower <- q1 - 1.5 * iqr
upper <- q3 + 1.5 * iqr
outliers <- wght < lower | wght > upper
mean_wght <- round(mean(wght, na.rm = TRUE))
df$Weight <- wght
summary(hght)


###

# Exercise #5: Find anomalies in hght using the IQR Rule.
# This time rewrite hght anomalies with the mean of the corresponding gender.

# Solution:

hght <- df$Hight
q1 <- quantile(hght, 0.25, na.rm = TRUE)
q3 <- quantile(hght, 0.75, na.rm = TRUE)
iqr <- q3 - q1
lower <- q1 - 1.5 * iqr
upper <- q3 + 1.5 * iqr
outliers <- hght < lower | hght > upper


#outliers
cond21<-hght[gender=="male"]>quantile(hght[gender=="male"],0.75,na.rm=T) + 1.5*IQR(hght[gender=="male"],na.rm=T)|hght[gender=="male"]<quantile(hght[gender=="male"],0.25,na.rm=T) - 1.5*IQR(hght[gender=="male"],na.rm=T)
cond22<-hght[gender=="female"]>quantile(hght[gender=="female"],0.75,na.rm=T) + 1.5*IQR(hght[gender=="female"],na.rm=T)|hght[gender=="female"]<quantile(hght[gender=="female"],0.25,na.rm=T) - 1.5*IQR(hght[gender=="female"],na.rm=T)
#replacing with mean that doesn't contain outliers
hght[gender=="male"] <- ifelse(cond21, round(mean(hght[gender=="male"][!cond21],na.rm=T),0),
                               hght[gender=="male"])
hght[gender=="female"] <- ifelse(cond22, round(mean(hght[gender=="female"][!cond22],na.rm=T),0),
                                 hght[gender=="female"])
summary(factor(hght))


###

# Exercise #6. Use na.omit() for the whole dataframe. 
# How much observations left? How to interpret this?

# Solution:


df <- read.csv("responses.csv")
df_copy <- df
nrow(na.omit(df_copy))
nrow(df)

###

# Exercise #7: Check the correlation between df$Height and df$Weight.
# Is it ok? If not, check the correlation between hght and wght. Discuss.

# Solution:

plot(df$Height, df$Weight, cex = 0.3)
plot(hght, wght, cex = 0.3)

cor(hght, wght)
sum(is.na(wght))
sum(is.na(df$Height))

###

# Exercise #8: Check the correlation between God and Religion. 
# For this you need to fill NA first or remove them. This time, let's remove?

# Solution: 
plot(df$God, df$Religion)
cor(df$God, df$Religion)


df_copy_2 <- df
na.omit(gf_copy_2$God)
na.omit(df_copy_2$Religion)
###

# Exercise #9: We'd like to create a correlation matrix between all variables.
# For this, you'd first need to take only numeric variables and then omit NA.
# Save the result into cormat.

# Solution: 

numeric_df <- na.omit(df[sapply(df, is.numeric)])
cormat <- cor(numeric_df)

###

# Exercise #10: Install and load the library corrplot. 
# Use corrplot() function on cormat. Discuss the result.

# Solution: 

install.packages("corrplot")
library(corrplot)
corrplot(cormat)
?corrplot

###

# Exercise #11: Find the minimum value in the cormat. 
# For this use the function which() with a parameter arr.ind=T, 
# where you're finding the value of matrix is equal to the minimum value
# of the matrix. Discuss.

# Solution: 

which(cormat == min(cormat[cormat < 1]), arr.ind = TRUE)

###

# Exercise #12: Do the same for the max. Note that there may be a problem 
# with the maximum, fix it. Discuss. 

# Solution:



###

# Exercise #13: Repeat the exercise with correlation matrix and its max/min
# for different genders. Discuss the results.

# Solution:

###
