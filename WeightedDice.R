#***************Project 1: Weighted Dice ***********************

#***************Chapter 2: The Very Basics ******************
#We'll build a pair of virtual dice to generate random numbers.  First, we need to distill each die into 
#its essential features by placing information into memory.  

#A die has 6 important pieces of info: 1,2,3,4,5,6

#Note:  The colon operator returns every integer between two integers, and is an easy way to create a 
# sequence of numbers.

#Note: you can cancel an R command by entering "ctrl + c"

#Exercise 2.1:
#1. Choose any number and add 2:
5+2
#2. Multiply the result by 3:
7*3
#3. Subrtract 6 from that result:
21-6
#4. Divide that result by 3:
15/3
#You should wind up with your original number


# ***************2.2 Objects ***************
#Let's make a vuirtual die.  The : operator will produce a vector:
1:6

#This vector isn't stored anywhere.  We need to store the result inside an R object. For example:
a <- 1
a
a+2

#For our die:
die <- 1:6
die
#Note the object is now visible in the Environment pane

#Object names cannot start with a number or use special characters such as ^, !, $, @, +, -
#R IS case-sensitive!!
#R will overwrite previous object names, so don't re-use them

#We can do a lot with our die:
die - 1

die / 2

die * die

#R doesn't always follow the rules of matrix multiplication.  R uses element-wise execution.
#When we manipulate a set of numbers, R applies the same operation to each element.

#When we use 2 or more vectors, R lines up the vectors and performs a sequence of individual
#operations, first element of first vector * first element of second vector, for example.

#If the 2 vectors are of unequal length, R recylces the shorter vector (eg, "vector recycling").
1:2

1:4

die

die + 1:2

#Warning message in teh even the longer vector is not a multiple of the shorter vector:
die + 1:4

#We can also do traditional matrix multiplication with R.

#Inner multiplication with %*% operator:
die %*% die

#Outer multiplication with the %o% operator:
die %o% die

#You can alsao transpose a matrix with t, or take its determinant with det:
t(die)
det(die)

#How can we "roll" our die?  We'll need a function.


#***********2.3 Functions *************** 
#R is loaded with function.  Just write the name of the function and then the data you want to 
#operate on in parentheses:
round(3.1415)

factorial(3)

#The data we pass is called the function's argument.  This can be raw data, an R object, or the result 
#of another function:

mean(1:6)

mean(die)

#When linked together, functions are resolved from innermost to outermost.
round(mean(die))

#We can simulate rolling the die with R's sample function.
#Sample takes 2 arguments: a vector named x, and a number named size.  
#sample returns size elements from x vector:
sample(x=die, size = 1)

#You'll get a new number each "roll", and it may be different.

#Using argument names inside of functions is optional, however. But, how do we know what 
#the arguments are?

#Note: look up function names with args:
args(round)
#Note, the digits argument is 0 by default.  If we don't type anything for digits, it'll assume 0.
#To override the default, enter a different value:
round(3.1415, 2)

#Not writing argument names is slightly quicker, but in the end, may create confusion.
#It's better to write the argument names, for clarity sake, and because writing the argument 
#name allows us to use the arguments out of sequence:
round(digits=2, x=3.145)

#***********2.3.1 Sample with Replacement 
#Sampling with Replacement is an easy way to create independent random samples.

#If we set size = 2, we can almost simulat rolling a pair of dice.  However, if size>1, the sample won't repeat:
sample(x=die, size = 3)

#By default, sample builds a sample without replacement.  Imagine sample reaches into a jar and retrieves
#values one by one... Once drawn, sample sets it aside, so it can't be drwan again.  So each selection (roll)
#is dependent on what came before.  But two dice being rolled have independent outcomes.
#We can create this behavior by setting the argument replae = TRUE:
dice <- sample(x=die, size = 2, replace = TRUE)

#If we want to sume the results of our simulated roll of 2 dice, feed the result straight into the sum function:
sum(dice)

#Will dice generate a new pair each time we call it?  
dice

dice

dice
#Nope: it retrieves the result of the one time we called sample and saved the output to dice.
#It would be nice to an object which could re-roll the dice whenever we call it:


#***********2.4 Writing your own Functions *************** 
#Let's write a function called roll which re-rolls and returns the sum of the two dice:

#***********2.4.1 The Function Constructor 
#Functions are just another type of R object; they contain code instead of data
#Every function has 3 basic parts: a name, a body of code, and a set of arguments.
#To create a function, replicate these parts and store in an R object with the function function.
#To do this, call function() and follow it with a pair of braces, {}:
my_function <- function() {}

#function will build a function out of whatever code you put between the braces.  For example:
roll <- function() {
     die <- 1:6
     dice <- sample(die, size = 2, replace = TRUE)
     sum(dice)
}
 
#Indenting each line of code makes it easier to read. 
#R ignores spaces and line breaks and executes one expression at a time.
#Don't forget to save the function to an R object.  To use it, type the function name followed by ():
roll()

#Think of these parense as a trigger; if you type the function name without them, it just returns the code:
roll

#The code inside the function is known as teh body.  R executes all of the code within the body and returns
#the result of the last line of code.  If the last line of code doesn't return a value, neither will your function.


#***********2.5 Arguments ***************
#What if we removed one line of code from our function, and changed the name die to bones?
roll2 <- function() {
     dice <- sample(bones, size = 2, replace = TRUE)
     sum(dice)
}
#We get an error.  The function needs an object named bones, but there is none.
roll2()

#If we makes bone an argument of the function, we can supply it to roll2.  
#To do this, put bones in the parentheses that follow function when you define roll2: 
roll2 <- function(bones) {
     dice <- sample(bones, size = 2, replace = TRUE)
     sum(dice)
}

#Now, roll2 will work as long as we supply bones when calling the function.  That way, we can roll different kinds of dice
#each time we call roll2:
roll2(bones = 1:4)
roll2(bones = 1:6)
roll2(1:20)

#rool2() still returns an error if we don't supply a value for the bones argument:
roll2()

#We can prevent this error by giving the bones argument a default value:
#To do this, set bones equal to a value when defining roll2:
roll2 <- function(bones = 1:6) {
     dice <- sample(bones, size = 2, replace = TRUE)
     sum(dice)
}

roll2()

#Give a function as many arguments as you'd like.  Just list names, separated by commas in the parentheses 
#which follow function.
#When the function is run, R replaces each argument name in the function body with the value that the user
#supplies for the argument.  If the user doesn't supply a value, R uses the default value (if defined).

#To Summarize:
#function enables us to create our own R functions.
#Create a body of code for the function by typing code between the braces that follow function.
#Create arguments for your function to use by supplying their names in the parentheses following function.
#Finally, give your function a name by saving its output to an R object.


#***********2.5 Scripts ***************
#An R script is just a plain text file where we save our R code.
# ctrl + return is a shortcut for the run button

#Note: RStudio has "Code > Extract" to help build functions.  
#To use, highlight the lines of code you want to turn into a function.  Then click Code > Extract.
#R will ask for a function name to use, then wrap the code in a function call.
#It scans the code and uses undefined variables as arguments.


#***************Chapter 3: Packages and Help Pages ******************
#Now let's work on weighting the dice in our favor.  But before that, we should make sure they're fair to begin with.
#Repetition and Visualization can help with this.

#We'll repeat our dice rolls with a function called replicate, and visualize the rolls in qplot.


#***************Chapter 3.1: Packages
#qplot comes in the ggplot2 package - so we need to download and install it.


#***************Chapter 3.1.1: install.packages 
#run install.packages("ggplot2")
install.packages("ggplot2")


#***************Chapter 3.1.2: library
#To use an R package, we have to load it in our session with library:
library("ggplot2")

#See the code behind the function:
qplot

#Take qplot (quickplot) for a test drive.  Create a data set:
x <- c(-1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1)
x

y <- x^3
y

qplot(x,y)

#We want a histogram to visualize the distribution of our dice rolls.
#qplot will make a histogrtam if you give it only one vector to plot:
x <- c(1,2,2,2,3,3)

qplot(x, binwidth=1)

#Replicate provides an easy way to repeat an R command many times.
#Give replicate the number of times to repeat, then the command.  It will store the results as a vector.
replicate(3, 1+1)

rolls <- replicate(10000, roll())

qplot(rolls, binwidth=1)

#Now, how can we bias these results higher?  We can increase the frquency that 6 occurs more often by
#adding a new argument to the sample function.


#***************Chapter 3.2 Getting Help with R Packages
?sample

#Help pages almost always contain useful samle code at the end.

#***************Chapter 3.2.1 Parts of a Help Page
#Description-short summary
#Usage - example of how you'd type the function.  Each argument is listed in order (in case you don't type
#the argument name)
#Arguments - a list of each, what type R expects, and what the function will do with it
#Details - an in-depth description
#Value - description of what the function returns
#See Also - short list of related R functions
#Examples - example code which uses the function and is guaranteed to work

#To search by keyword, use two ??'s

#Now, let's re-write the roll function to roll a pair of weight dice:
roll <- function() {
     die <- 1:6
     loaded <- c(.125, .125, .125, .125, .125, .375)
     dice <- sample(die, size = 2, replace = TRUE, prob = loaded)
     sum(dice)
}

roll()

rolls <- replicate(1000, roll())
qplot(rolls, binwidth=1)
#You can now see the bias!


#***************Chapter 3.2.2 Getting More Help
#https://tolstoy.newcastle.edu.au/R/
#community.rstudio.com










































