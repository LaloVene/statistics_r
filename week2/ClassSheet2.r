### Stats with R class sheet 2


## This class sheet contains the exercises that you will need to complete and 
## submit within the next 60 minutes. Write the code below the questions. 
## If you need to provide a written answer, comment this out using a hashtag (#). 
## Submit your class sheet via cms (one member) and notify your tutor once you are done.

## Please write below all Names and Matriculation numbers of your team members that are present:
## Name:
## Matriculation number:
## Name:
## Matriculation number:
## Name:
## Matriculation number:

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


## please run the following line to convert the data into numeric
discoveries = as.numeric(discoveries)

## b) Take a look at the dataset using the table() function and histogram and boxplot. 

## c) Compare mean and median of the dataset

## d) Create a random sample of a normal distribution of equal length (same number of data points) and with the same mean and 
##   standard deviation as the observed dataset (discoveries), assign it to norm_disc

## e) Make a histogram of norm_disc and compare this to the histogram of the original dataset from b

## f) Describe the differences observed in e

## g) Now, we are going to draw a smaller sample from discoveries.
## Use the function sample() to create a sample of four instances from discoveries
## assign it to sample4

## h) draw another 2 samples of 4 called sample4b and sample4c

## i) calculate the mean of the two samples and store them in the vector means4

## j) Are the values different? Why?

## k)   In order to draw a distribution of such a sample, we want to calculate the
##   mean of 1000 samples, each of size 4. However, we don't want to repeat 
##   question e and f 1000 times. Use a for loop to draw 1000 samples of size 4
##   and store the mean of each sample in the vector means4.

## l) Repeat the for-loop in question k, but use a sample size of 40. 
##    Assign this to 'means40' instead of 'means4'.

## m) Explain in your own words what 'means4' and 'means40' now contain. 
##    How do they differ?

## n) Draw histograms of means4 and means40. Describe in what way they differ

## o) Why do you observe a skew for means4, but not for means40?

