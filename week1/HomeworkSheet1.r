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

##  b)  What do you observe in a?
# for each run, the histogram looks slightly different and not necessarily like
# a normal distribution!

# Answer - Even though the samples are drawn from the same normal distribution,
# each sample looks slightly different due to sampling variability.


###############
### Exercise 4: data exploration and  histograms
###############
## In this exercise, we will deal with data from a package.

## a) Install the package "languageR" and load it.
install.packages("languageR")
library(languageR)

## b) Specifically, we will deal with the dataset 'lexdec'.
##    This dataset should be available to you once you've loaded languageR.
##    Find out what experiment the data comes from

data("lexdec")
?lexdec

# Answer - The data is from a lexical decision experiment in which 21 subjects
# participated. Latencies along with many other properties were
# recorded for 79 English nouns.

## c) Inspect 'lexdec'. Look at the head, tail,
##    and summary.
head(lexdec)
tail(lexdec)
summary(lexdec)

## d) What do head and tail show you?
## head() returns first n rows, 6 by default
## tail() returns last n rows, 6 by default

## e) Look at the first 15 rows of the data.frame
head(lexdec, n = 15)

## f) The file contains multiple observations for each participant. Create a
##   subset only including subject number S and assign it to S
##   How many observations are there for this participant, i.e. how many rows
##   are in your subset?
S <- subset(lexdec, Subject == "S")
nrow(S)

## Answer - There are 79 rows for participant S

## g) looking at the summary of S, what can you find out about the demographic
##    parameters of this participant?
summary(S)
## Answer - Participant S is female and Native English speaker

## h) Create a histogram (using hist()) of "RT" (logarithm of reaction time)
##    for S
hist(S$RT)

## i) Create a kernel density plot for this data using density()
plot(density(S$RT))

## j) What is the difference between the two?

## k) Is this data likely from a normal distribution? How would you check ?
##    (describe in words, remember to comment out text)

## l) Looking at the graph, do you think the data is skewed? In which direction?

#############################################
### Exercise 5: Dataframes and boxplots
#############################################
# A researcher is interested in the way children tell stories. More specifically,
# she wants to know how often children use 'and then'. She asks 26 children to
# tell her a story, and counts the number of times they use 'and then'.
# The data follow:

# 18	15	18	19	23	17	18	24	17	14	16	16	17	21	22	18	20	21	20	20
# 16	17	17	18	20	26


## a) What measurement scale is this data? Is it discrete or continuous? Explain
##    in one sentence why.

## b) The researcher is also interested in whether story telling is related to
##    their reading habits. As a proxy, she asked the children, whether they have
##    a library card. The following line codes that the first 13 observations are
##    from children with library card (Y) and the remaining 13 from children
##    without (N). What measurements scale does this variable have?
## lib = c(rep("Y",13),rep("N",13))

## c) You will now create a dataframe of this data. Start by creating a vector
##    with participant IDs. Your vector should be named 'pid', and your
##    participants should be labeled from 1 to 26

## d) Next, create a vector containing all the observations. Name this vector 'obs'.

## e) Create a dataframe including pid, obs and lib. Assign this to 'stories'.

## f) Take a look at the summary of your dataframe, and at the classes of your
##    columns. What class are the variable 'pid' and 'lib'?

## g) Change the class of 'pid' and 'lib' to factor. Why is factor a better
##     class for these variables? (answer for both separately)

## h) Create a boxplot of obs for the two lib groups

## i) Are there outliers in one of the lib groups?

## j) Which group shows the larger interquartile range?

## k) Which one has the  greater overall range?

## l) What is a whisker? Why is the upper whisker of group "Y" so short?

## m) Compare the median of group Y with the mean - which one is plotted in your
##    boxplot? Why are they different?
