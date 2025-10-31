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
## Name: Mahalakshmi Raveenthiran
## Matriculation number: 7071187
## Name: Eduardo Venegas
## Matriculation number: 7069924
## Name: Elias
## Matriculation number:7055205

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

# It means that if we were to repeat the experiment multiple times and calculate a confidence interval (for example, 95%), we would expect that approximately 95% of those intervals would contain the true population mean.

# ____________________________________________________________________________

## b) please install and load packages sciplot and lsr

install.packages("sciplot")
install.packages("lsr")
library("sciplot")
library("lsr")

# ____________________________________________________________________________

## c) We will be working with the dataset rivers, that lists the length of major US rivers. What does the following line do?

sample15 = sample(rivers,15)
# it randomly samples 15 river lengths

# ____________________________________________________________________________

## d) calculate 95% Confidence Intervals for rivers and sample15. You can
##    use the function ciMean()
ciMean(rivers, conf=.95)
ciMean(sample15, conf=.95)

# ____________________________________________________________________________

## e) Why are the intervals different?

# they are different because a smaller sample size introduces more variability and uncertainty in estimating the population mean, this results in a wider confidence interval for sample15 compared to rivers. We go from 508-673 for rivers to 426-716 for sample15.

# ____________________________________________________________________________

## f) We will now calculate the confidence interval for the mean of rivers by hand. 
##    A commonly used formula for 95% confidence intervals is mean±1.96*SE

avg <- mean(rivers)
se <- sd(rivers) / sqrt(length(rivers))
lower_bound <- avg - 1.96 * se
upper_bound <- avg + 1.96 * se
c(lower_bound, upper_bound)

# ____________________________________________________________________________

## g) Do your results align with the output of ciMean above? (There might be a bit of rounding error)

# Yes, the results align with the output of ciMean above.
# > c(lower_bound, upper_bound)
# [1] 509.6652 672.7036

# > ciMean(rivers, conf=.95)
#            2.5%    97.5%
# rivers 508.9559 673.4129

# ____________________________________________________________________________

## h) Now, please calculate a 90% confidence interval without the ciMean function. 
##  Hint: You need to replace the 1.96, which is the 97.5 quantile of the normal distribution.

z_score <- qnorm(0.95)
lower_bound <- avg - z_score * se
upper_bound <- avg + z_score * se
c(lower_bound, upper_bound)
# 522.7726 659.5962

# > ciMean(rivers, conf=.90)
#              5%      95%

# ____________________________________________________________________________

## i) Compare to the interval in g!

# The 90% confidence interval is narrower than the 95% confidence interval. We become less certain about the population mean as we decrease the confidence level, which results in a smaller interval.


#################################################################################
##  Exercise 4: Cleaning data
#################################################################################

## download the file insomnia25.csv from cms
## The made-up dataset insomnia contains data of a survey on 63 students. 
## They are asked two questions: whether they regularly encounter sleep problems
## and what their preferred and most consumed drink is.

## a. Load the libraries stringr, dplyr, tidyr and forcats
install.packages("stringr")
install.packages("dplyr")
install.packages("tidyr")
install.packages("forcats")

library("stringr")
library("dplyr")
library("tidyr")
library("forcats")

## b. read in the data
getwd()
insomnia <- read.csv("./week2/insomnia25.csv")

## c. get a summary of the dataset
glimpse(insomnia)

## d. the variable sleepProblem should be a numerical variable and have 0 for no Problem 
##    and 1 for sleep problems.
##    Make sure that this is the case
insomnia %>%
    count(sleepProblem)

# insomnia$sleepProblem  n
# 1                     0 39
# 2                     1 22
# 3                    11  1
# 4                   yes  1

insomnia <- insomnia %>%
    mutate(sleepProblem = ifelse(sleepProblem == "yes", 1, sleepProblem)) %>%
    mutate(sleepProblem = ifelse(sleepProblem == 11, 1, sleepProblem)) %>%
    mutate(sleepProblem = as.numeric(sleepProblem))

insomnia %>%
    count(sleepProblem)
#   sleepProblem  n
# 1            0 39
# 2            1 24

## e. how many students encounter sleep problems?
insomnia %>%
    filter(sleepProblem == 1) %>%
    nrow()

## f. how many different drinks do students name? (transform the variable into a 
## factor first)
drinks <- as.factor(insomnia$drink)

## g. collapse factor levels which were spelled wrong

## h. Assign your cleaned dataset to clean


