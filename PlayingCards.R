#***************Project 2: Playing Cards ***********************
#This project teaches how to store, retrieve, and change data values in memory by designing a set of playing
#cards to shuffle and deal from.

#Save new data types (strings, logical values)
#Save data sets as vector, matrix, array, list, or data frames
#Load and save data sets
#Extract individual values from a set
#Change indivbidual values within a set
#Write logical tests
#Use R's missing value symbol, NA

#Task 1: build the deck
#In R Objects, we'll design and build the virtual deck.  Need to learn R's data types and data structures 
#to make this work.

#Task 2: write functions to deal and shuffle
#In R Notation, we'll write 2 functions to use with the deck - one to deal, one to re-shuffle.
#To do this, we'll need to extract values from a data set.

#Task 3: change the point system to suit the game
#In Modifying Values, we'll use R's notation system to change the values of the cards to match the game
#we're playing.  

#Task 4: manage the state of the deck
#In Environments, we'll make sure the deck remembers which cards it's dealt.


#***************Chapter 5: R Objects ******************
#We're going to assemble a deck of 52 playing cards, starting with simple objects and building to a full data set.


#***************5.1: Atomic Vectors 
#An atomic vector is just a simple vector of data:
die <- c(1,2,3,4,5,6)
die

#Test whether we have an atomic vector:
is.vector(die)

#Can make an atomic vector with just one value:
five <- 5
five

is.vector(5)

length(5)
length(die)

#Each atomic vector can store only one type of data.  There are 6 basic types recognized by R:
     #doubles
     #integers
     #characters
     #logicals
     #complex
     #raw

#For the card deck, we'll need vectors of different types.  We can do this via simple conventions when entering.
#Each type has its own convention


#***************5.1.1: Doubles
#Doubles store regular numbers, with or without decimal places to the right.  Can store integers, too.
#R will store integers as doubles by default.

#"numerics" is another term for doubles.


#***************5.1.2: Integers
#Integers are numbers which can be written without a decimal point.  YOu won't use integers very often.
#In fact, we have to force R to read as an integer, by appending an uppercase "L":
int <- c(-1L, 2L, 4L)
int
typeof(int)

#You might store something as an integer because doubles are a bit imprecise:
sqrt(2)^2 - 2
#This causes a floating point error.


#***************5.1.3: Characters
#A character vector store a small piece of text.  Create a character vector by typing a character or string
#surrounded by quotes:

text <- c("Hello", "World")
text
typeof(text)
typeof("Hello")

#The individual elements of a character vector are known as strings.
#A string can contain more than just letters; we can create a character string from symbols or numbers.
#However, anything which is returned in quotes is a string.


#***************5.1.4: Logicals
#Logical vectors store TRUEs and FALSEs.
#Logicals are hlepful for doing comparisons:
3 > 4

#When we type TRUE or FALSE without quotation marks R treats this as logical data.
#T and F are shorthand for TRUE and FALSE:
logic <- c(TRUE, FALSE, TRUE)
logic

typeof(logic)

typeof(F)


#***************5.1.5: Complex and Raw
#Complex vectors store complex numbers.  To create a complex vector, add a term:
comp <- c(1 +1i, 1 + 2i, 1 + 3i)
comp
typeof(comp)

#Raw vectors store raw bites of data


####Exercise 5.2: Vector of cards
#Create an tomic vector with the face names of the cards in a royal flush:
hand <- c("ace", "king", "queen", "jack")
hand
typeof(hand)
#This is a one-dimensional hand.  We need a two-dimensional table of card names and suites by building an atomic 
#vector, giving it some attributes, and assigning a class.


#***************5.2: Attributes




#***************Chapter 6: R Notation ******************



#***************Chapter 7: Modifying Values ******************



#***************Chapter 8: Environments ******************



































