### Stats with R class sheet 1

## This exercise sheet contains the exercises that you will need to complete
## in your first tutorial session. Write the code below the questions.
## If you need to provide a written answer, comment this out using a hashtag (#).
## Submit your homework via cms BY THE END OF THE FIRST PART OF THE TUTORIAL SESSION
## Only one student of your assignment group needs to submit. Please tell your
## tutor once you have submitted, you can then start working on the homework sheet.
## You need to provide a serious attempt at solving each exercise in order to have
## the assignment graded as complete, please do not leave out subquestions!

## Please write below the names of all students from your assignment group present:
## Name:
## Name:
## Name:


## Many of the things on this exercise sheet have not been discussed in class.
## The answers will therefore not be on the slides. You are expected to find
## the answers using the help function in R, in the textbooks and online. If you
## get stuck on these exercises, you can ask your tutor.
## You cannot use chatGPT or any other AI engine to answer your questions. If we
## catch you using one, we will grade the entire sheet as failed.

###############
### Exercise 1: Getting started
###############
## a) Look at your current working directory.

## b) Get help with this function.

## c) Change your working directory to another directory.

###############
### Exercise 2: Normal distribution plotting
###############
## In this exercise, we will plot normal distributions.

## a) First, use seq() (?seq) to select the x-values to plot the range for
##    (will become the x-axis in the plot).
##    Get R to generate the range from -4 to 4, by 0.1. Assign this to the
##    variable x.
x <- seq(-4, 4, by = 0.1)

## b) Now we need to obtain the y-values of the plot (the density). We do this
##    using the density function for the normal distribution.
##    Use "help(dnorm)" to find out about the standard functions for the normal
##    distribution.
y <- dnorm(x)

## c) Now use plot() to plot the normal distribution for z values of "x".
plot(x, y)
## d) The plot now has a relatively short y-range, and it contains circles
##    instead of a line.
##    Using plot(), specify the y axis to range from 0 to 0.6, and plot a line
##    instead of the circles.
plot(x, y, type = "l", ylim = c(0, 0.6))

## e) We want to have a vertical line to represent the median of our distribution.
##    'abline()' can do this for us. Look up help for abline().
##    Use abline() to create the vertical line. Specify the median of x using
##    the argument 'v'.
##    In order to get a dashed line, set the argument 'lty' to 2.
med <- median(x)
abline(v = med, lty = 2)

## f) Take a look at the beaver2 dataset. (You can see it by typing "beaver2".)
##    Then select only the temperature part and store it in a variable "b2temp".
b2temp <- beaver2$temp

## g) Calculate the mean and standard deviation of this dataset and plot a normal
##    distribution with these parameters.
avg <- mean(b2temp)
std <- sd(b2temp)
x2 <- seq(min(b2temp) - 3 * std, max(b2temp) + 3 * std, by = 0.1)
y2 <- dnorm(x2, mean = avg, sd = std)
plot(x2, y2, type = "l")
abline(v = avg, lty = 2)

## h) We observe two temperatures (38.03 and 36.21). What's the likelihood that
##    these temperatures (or more extreme ones) respectively come
##    from the normal distribution from g)?
abline(v = 38.03, lty = 2)
abline(v = 36.21, lty = 2)
p38 <- pnorm(38.03, mean = avg, sd = std)
p36 <- pnorm(36.21, mean = avg, sd = std)

p_extreme_38 <- 1 - p38
p_extreme_36 <- p36
