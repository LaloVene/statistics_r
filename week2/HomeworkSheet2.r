### Stats with R Exercise sheet 2

###############################################################
# Deriving sampling distribution and confidence intervals
###############################################################

## This exercise sheet contains the exercises that you will need to complete and 
## submit by 23:55 on Saturday, November 1st. Write the code below the questions. 
## If you need to provide a written answer, comment this out using a hashtag (#). 
## Submit your homework via cms
## Remember to answer each subquestion and test your code, before you submit.


## Please write below your (and your teammates) name, matriculation number. 
## Name: Mahalakshmi, Eduardo, Elias
## Matriculation number: 7071187

## Only 1 member needs to submit! 

#############################################
## Exercise 2: Concepts
#############################################

## The following code performs a t test (covered in week 6) to compare mean monthly accident deaths between the
## years 1973 and 1978 in the US

t.test(USAccDeaths[1:12], USAccDeaths[61:72], alternative="greater")

## Look at the output and - without knowing the details of the underlying test - try to answer
## the following questions:

## a) Is the test significant at the alpha level of 0.05?
# Yes, the test is significant at alpha level of 0.05 since the p-value is 0.02151, which
# is below 0.05. So, we can reject null hypothesis. 

## b) What is the probability that this result is subject to a Type I error?
# There is ~2.15% probability that this result is subject to a Type I error(false positive)

## c) Is this output also suited to tell you something about the Type II error probability?
# No, the output does not tell anything about the Type II error. The t-test only gives us p-value,
# which tells us about Type I error. It doesn't give β value which is the probability associated with Type II error

## d) Is this test one-tailed or two-tailed?
# The test is one-tailed because the command says alternate = "greater". This means we are only
# checking one direction of difference(number of deaths in 1973 is greater than in 1978)

## e) Do you think the test should be one-tailed or two-tailed?
# I think the test should be two-tailed because we don't have specific prediction about the direction beforehand.
# As mentioned in the lecture, two-tailed tests are more conservative and reduce the risk of making Type I error

###############################################################
### Exercise 3: Confidence interval
###############################################################

## A confidence interval is a range of values that is likely to contain an 
## unknown population parameter.
## The population parameter is what we're trying to find out. 
## Navarro discusses this in more depth in chapter 10.


## a) What does a confidence interval mean from the perspective of experiment replication?

## b) please install and load packages sciplot and lsr

## c) We will be working with the dataset rivers, that lists the length of major US rivers. What does the following line do?
sample15 = sample(rivers,15)

## d) calculate 95% Confidence Intervals for rivers and sample15. You can
##    use the function ciMean()

## e) Why are the intervals different?

## f) We will now calculate the confidence interval for the mean of rivers by hand. 
##    A commonly used formula for 95% confidence intervals is mean±1.96*SE

## g) Do your results align with the output of ciMean above? (There might be a bit of rounding error)

## h) Now, please calculate a 90% confidence interval without the ciMean function. 
##  Hint: You need to replace the 1.96, which is the 97.5 quantile of the normal distribution.

## i) Compare to the interval in g!


#################################################################################
##  Exercise 4: Cleaning data
#################################################################################

## download the file insomnia25.csv from cms
## The made-up dataset insomnia contains data of a survey on 63 students. 
## They are asked two questions: whether they regularly encounter sleep problems
## and what their preferred and most consumed drink is.

## a. Load the libraries stringr, dplyr, tidyr and forcats

## b. read in the data

## c. get a summary of the dataset

## d. the variable sleepProblem should be a numerical variable and have 0 for no Problem 
##    and 1 for sleep problems.
##    Make sure that this is the case

## e. how many students encounter sleep problems?

## f. how many different drinks do students name? (transform the variable into a 
## factor first)

## g. collapse factor levels which were spelled wrong

## h. Assign your cleaned dataset to clean

