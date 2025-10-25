### Stats with R Exercise sheet 1

## This exercise sheet contains the exercises that you will need to complete and
## submit by 23:55 on Saturday, October 25. Write the code below the questions.
## If you need to provide a written answer, comment this out using a hashtag (#).
## Submit your homework via cms
## You are required to work together in your assignment group (3 students, same tutorial)
## You need to provide a serious attempt at solving each exercise in order to have
## the assignment graded as complete, please do not leave out subquestions and
## make sure the code is executable!

## Many of the things on this exercise sheet have not been discussed in class.
## The answers will therefore not be on the slides. You are expected to find
## the answers using the help function in R, in the textbooks and online. If you
## get stuck on these exercises, remember: Google is your friend. You are not
## allowed to use chatGPT or other AI engines.
## If you have any questions, you can ask these during the tutorial, or use the
## cms discussion board for the course.


###############
### Exercise 3: Normal distribution generation
###############

# ________________________________________________________________________________

## a) Use the random sampling function in R to generate 30 random samples from
##    a normal distribution with mean 6 and standard deviation 4, and draw a
##    histogram based on this sample.
##    Repeat 5 times. Set the range of the x-axis between -2 to 12 using xlim.
##    Fix the number of breaks to 11 using breaks
set.seed(43)
graphics.off()
par(mfrow = c(3, 2), mar = c(4, 4, 2, 1))
for (i in 1:5) {
    x <- rnorm(30, mean = 6, sd = 4)
    hist(x,
        breaks = 11,
        xlim = c(-2, 12),
        main = paste("Histogram", i),
        xlab = "x",
        ylab = "Frequency"
    )
}
par(mfrow = c(1, 1))

# ________________________________________________________________________________

##  b)  What do you observe in a?
# for each run, the histogram looks slightly different and not necessarily like
# a normal distribution!

# Answer - Even though the samples are drawn from the same normal distribution,
# each sample looks slightly different due to sampling variability.

# ________________________________________________________________________________

###############
### Exercise 4: data exploration and  histograms
###############
## In this exercise, we will deal with data from a package.

# ________________________________________________________________________________

## a) Install the package "languageR" and load it.
install.packages("languageR")
library(languageR)

# ________________________________________________________________________________

## b) Specifically, we will deal with the dataset 'lexdec'.
##    This dataset should be available to you once you've loaded languageR.
##    Find out what experiment the data comes from

data("lexdec")
?lexdec

# Answer - The data is from a lexical decision experiment in which 21 subjects
# participated. Latencies along with many other properties were
# recorded for 79 English nouns.

# ________________________________________________________________________________

## c) Inspect 'lexdec'. Look at the head, tail,
##    and summary.
head(lexdec)
tail(lexdec)
summary(lexdec)

# ________________________________________________________________________________

## d) What do head and tail show you?
## head() returns first n rows, 6 by default
## tail() returns last n rows, 6 by default

# ________________________________________________________________________________

## e) Look at the first 15 rows of the data.frame
head(lexdec, n = 15)

# ________________________________________________________________________________

## f) The file contains multiple observations for each participant. Create a
##   subset only including subject number S and assign it to S
##   How many observations are there for this participant, i.e. how many rows
##   are in your subset?
S <- subset(lexdec, Subject == "S")
nrow(S)

## Answer - There are 79 rows for participant S

# ________________________________________________________________________________

## g) looking at the summary of S, what can you find out about the demographic
##    parameters of this participant?
summary(S)
## Answer - Participant S is female and Native English speaker

# ________________________________________________________________________________

## h) Create a histogram (using hist()) of "RT" (logarithm of reaction time)
##    for S
hist(S$RT)

# ________________________________________________________________________________

## i) Create a kernel density plot for this data using density()
plot(density(S$RT))

# ________________________________________________________________________________

## j) What is the difference between the two?

## Answer - h) produces a histogram, showing the frequency of the data in a given interval, i) however creates
##          a density plot, a smooth curve showing the density according to the normal distributions used

# ________________________________________________________________________________

## k) Is this data likely from a normal distribution? How would you check ?
##    (describe in words, remember to comment out text)
## Answer - No this is not data from a normal distribution, you can check visually and look for a bell shape or 
##          do a normality test like the shapiro-wilk test, which confirms it is not from a normal distribution 
shapiro.test(S$RT)
# ________________________________________________________________________________

## l) Looking at the graph, do you think the data is skewed? In which direction?
## Answer - Yes the data is positively skewed 


#############################################
### Exercise 5: Dataframes and boxplots
#############################################
# A researcher is interested in the way children tell stories. More specifically,
# she wants to know how often children use 'and then'. She asks 26 children to
# tell her a story, and counts the number of times they use 'and then'.
# The data follow:

data <- c(
    18, 15, 18, 19, 23, 17, 18, 24, 17, 14, 16, 16, 17, 21, 22, 18,
    20, 21, 20, 20, 16, 17, 17, 18, 20, 26
)

# ________________________________________________________________________________

## a) What measurement scale is this data? Is it discrete or continuous? Explain
##    in one sentence why.

# - The data is discrete, as it represents counts of occurences of saying a word.
# - The measurement scale is ratio, since there can be a true zero, the ocurreces when the child never says 'and then'.

# ________________________________________________________________________________

## b) The researcher is also interested in whether story telling is related to
##    their reading habits. As a proxy, she asked the children, whether they have
##    a library card. The following line codes that the first 13 observations are
##    from children with library card (Y) and the remaining 13 from children
##    without (N). What measurements scale does this variable have?

lib <- c(rep("Y", 13), rep("N", 13))

# - The variable is discrete, since it represents categories.
# - The measurement scale is nominal, since the categories have no order.

# ________________________________________________________________________________

## c) You will now create a dataframe of this data. Start by creating a vector
##    with participant IDs. Your vector should be named 'pid', and your
##    participants should be labeled from 1 to 26

pid <- 1:26

# ________________________________________________________________________________

## d) Next, create a vector containing all the observations. Name this vector 'obs'.

obs <- data

# ________________________________________________________________________________

## e) Create a dataframe including pid, obs and lib. Assign this to 'stories'.

stories <- data.frame(pid = pid, obs = obs, lib = lib)
stories

# ________________________________________________________________________________

## f) Take a look at the summary of your dataframe, and at the classes of your
##    columns. What class are the variable 'pid' and 'lib'?

summary(stories)
sapply(stories, class)

# - The class of 'pid' is integer.
# - The class of 'lib' is character.

# ________________________________________________________________________________

## g) Change the class of 'pid' and 'lib' to factor. Why is factor a better
##     class for these variables? (answer for both separately)

stories$pid <- as.factor(stories$pid)
stories$lib <- as.factor(stories$lib)
summary(stories)
sapply(stories, class)

# - 'pid' is better represented as a factor because it is a categorical identifier, not a numerical value.
# - 'lib' is better represented as a factor because it  also does not represent a numerical value, but categories (having a library card or not)

# ________________________________________________________________________________

## h) Create a boxplot of obs for the two lib groups

boxplot(obs ~ lib,
    data = stories,
    main = "Boxplot of observations by library card",
    xlab = "lib",
    ylab = "obs"
)

# ________________________________________________________________________________
## i) Are there outliers in one of the lib groups?

# - Yes, there is one outlier in group "N" (26), and two at group "Y" (23, 24).

# ________________________________________________________________________________

## j) Which group shows the larger interquartile range?

# - Group "N" shows a larger interquartile range, since the box is bigger.

# ________________________________________________________________________________

## k) Which one has the  greater overall range?

# - Group "N" has a greater overall range, since the distance between the minimum and maximum values is 3, while in group "Y" it is 2.

# ________________________________________________________________________________

## l) What is a whisker? Why is the upper whisker of group "Y" so short?

# - A whisker is a line that extends 1.5 times the interquartile above the third quartile and below the first quartile.
# - The upper whisker of group "Y" is short because the maximum value is close

# ________________________________________________________________________________

## m) Compare the median of group Y with the mean - which one is plotted in your
##    boxplot? Why are they different?
mean_Y <- mean(stories$obs[stories$lib == "Y"])
median_Y <- median(stories$obs[stories$lib == "Y"])

# - The boxplot shows the median, which is 17, while the mean is 17.84.
# - They are different because the mean is affected by utliers, while the median is not.
