### Stats with R class sheet 2


## This class sheet contains the exercises that you will need to complete and 
## submit within the next 60 minutes. Write the code below the questions. 
## If you need to provide a written answer, comment this out using a hashtag (#). 
## Submit your class sheet via cms (one member) and notify your tutor once you are done.

## Please write below all Names and Matriculation numbers of your team members that are present:
## Name: Mahalakshmi Raveenthiran
## Matriculation number: 7071187
## Name: Eduardo
## Matriculation number: 7069924
## Name: Elias
## Matriculation number:7055205

###############################################################
# Sampling distribution,confidence intervals, and data cleaning
###############################################################

###############################################################
### Exercise 1: Deriving sampling distributions
###############################################################
## In this exercise, we're going to derive sampling distributions for the mean with 
## different sizes.

## a) We will not use data from a normal distribution, but work with the poisson distribution, which is 
### often used for count data. We will use the dataset discoveries, please find out what it is about
?discoveries
# The numbers of “great” inventions and scientific discoveries in each year from 1860 to 1959.

## please run the following line to convert the data into numeric
discoveries = as.numeric(discoveries)

## b) Take a look at the dataset using the table() function and histogram and boxplot. 
table(discoveries)
hist(discoveries)
boxplot(discoveries)

## c) Compare mean and median of the dataset
mean <- mean(discoveries)
med <- median(discoveries)
hist(discoveries)
abline(v = med, lty = 2)
#The mean is greater than median

## d) Create a random sample of a normal distribution of equal length (same number of data points) and with the same mean and 
##   standard deviation as the observed dataset (discoveries), assign it to norm_disc
norm_disc <- rnorm(100, mean, sd(discoveries))
norm_disc

## e) Make a histogram of norm_disc and compare this to the histogram of the original dataset from b
hist(norm_disc)

## f) Describe the differences observed in e
# The histogram of original dataset is skewed to the right

## g) Now, we are going to draw a smaller sample from discoveries.
## Use the function sample() to create a sample of four instances from discoveries
## assign it to sample4
sample4 <- sample(discoveries, size = 4)
sample4

## h) draw another 2 samples of 4 called sample4b and sample4c
sample4b <- sample(discoveries, size = 2)
sample4c <- sample(discoveries, size = 2)

## i) calculate the mean of the two samples and store them in the vector means4
means4 <- c(mean(sample4b), mean(sample4c))
means4

## j) Are the values different? Why?
# Values are picked at random and due their variation the means differ 

## k)   In order to draw a distribution of such a sample, we want to calculate the
##   mean of 1000 samples, each of size 4. However, we don't want to repeat 
##   question e and f 1000 times. Use a for loop to draw 1000 samples of size 4
##   and store the mean of each sample in the vector means4.
means4 <- c()
for (x in 1:1000) {
  means4[x] <- mean(sample(discoveries, size = 4))
}
means4

## l) Repeat the for-loop in question k, but use a sample size of 40. 
##    Assign this to 'means40' instead of 'means4'.
means40 <- c()
for (x in 1:1000) {
  means40[x] <- mean(sample(discoveries, size = 40))
}
means40

## m) Explain in your own words what 'means4' and 'means40' now contain. 
##    How do they differ?
mean(means4)
mean(means40)
# means40 is closer to the original mean of discoveries. This is due to the law of large numbers.

## n) Draw histograms of means4 and means40. Describe in what way they differ
par(mar = c(1, 1, 1, 1))
hist(means4)
hist(means40)
# means40 is normally distributed and means4 is skewed to the right.

## o) Why do you observe a skew for means4, but not for means40?
# means4 is contains more variability because of the smaller sample size and 
# means40 approximates the normal distribution due to the central limit theorem.

