10/4
x<-8
x*3 
ls() #list objects in environment
# a vector of weights
weights <- c(50, 60, 50, 45, 70)
weights
animals  <- c("mouse", "rat", "dog")
# to get help on a function 
?mean
# number of elements
length(weights)
length(animals)
# to find the class of an object
class(animals)
#structure
str(weights) 
str(animals)
# add elements to vectors
weights <- c(weights, 90)
weights
weights<-c(30, weights)
weights
#challenge #1
z <- c(x, y, weights)
y <- 40
z <- c(x,y,weights)
z
mean(z)

# Data analysis
getwd()
list.files()
setwd("~/Desktop) # tilde should tie to your home directory - this allows you to move around directories

gapminder <- read.csv("gapminder.csv")
# allows to see first rows of data
head(gapminder)
head(gapminder,3)
class(gapminder)
str(gapminder)
row(gapminder)
#Challenge #2
str(gapminder)
# obs = rows, variables = columns

#Bracket subsetting- pulls out specific elements
weights[1]
weights[1:3]

#for dataframes, first row and 1st column
gapminder[1,1]

# 1st row, 3rd column
gapminder[1,3]

#500th row, 5 & 6th column
gapminder[500, 5:6]

#pull out a whole row
gapminder$pop

# equivalent to above
gapminder[,5]

#can also use name of column
gapminder[,"pop"]

# return all data for finland
gapminder[gapminder$country == "Finland", ]

#country and years where pop <100,000
gapminder[gapminder$pop <= 100000, c("country", "Year")]
gapminder[gapminder$pop <= 100000, c("country", "year")]

#challenge #3
gapminder[50,4]
gapminder[50,"lifeExp"]

gapminder[50,4]
gapminder$lifeExp[50]

gapminder[gapminder$lifeExp > 80, c("country")]
gapminder[gapminder$lifeExp>80, "country"]
gapminder[gapminder$lifeExp == min()]

#Challenge #4
#Countries w/ countries > 80
gapminder[gapminder$lifeExp >80, "country"]

#External packages in R
#installing a package
install.packages('dplyr")
install.packages("dplyr")
install.packages("dplyr")








