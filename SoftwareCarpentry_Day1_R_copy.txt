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
setwd("~/Desktop") # tilde should tie to your home directory - this allows you to move around directories

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

select(gapminder,country,year,pop)

gapminder_sml<-gapminder%>%
  filter(pop<=100000) %>%
  select(country,year)

gapminder%>%
  filter(gdpPercap >= 350000) %>%
  select(country, year, gdpPercap)

#Mutate adds another column to your dataset
gapminder %>%
  mutate(totalgdp = gdpPercap *pop) %>%

  group_by(continent)%>%
  summarize(meangdp = mean(totalgdp))

#total gdp by continent and year
gapminder%>%
  mutate(totalgdp = gdpPercap * pop)%>$
  groupby(continent, year)%>%
  summarize(meangdp = mean(totalgdp))

#mean and min gdp by continetn and year (select all Cntl + R)
gapminder%>%
  mutate(totalgdp = gdpPercap * pop) %>%
  group_by(continent, year)%>%
  summarize(meangdp = mean(totalgdp), mingdp = min(totalgdp))

#in RStudio you can use the environment to view the actual database

#Use group_by(() and summarize() to find the max life exp. for each continent

gapminder %>%  
  group_by(continent) %>%
  summarize(maxlife = max(lifeExp))

#Find mean, min and max life expetancy for each year
gapminder %>%
  group_by(year) %>%
  summarize(meanLE = mean(lifeExp), minLE = min(lifeExp), maxLE = max(lifeExp))

#pick a country find pop for each year prior to 1982.  return a dataframe w/ columns country, year and pop
gapminder %>%
  filter(country == "Finland", year <= 1982) %>%
  select(country, year, pop)

#FYI: select selects columns, summarize collapses stuff down
#FYI: look up dplyr and see if it's appropriate for dad
#FYI: obs in rows, variables in columns = DataMantra
#FYI: if you have multiple libraries with the same function name, you can specify by listing the package name::  (ex. dplyr::summarize())

#exporting a dataframe
gapminder_FL <- gapminder %>%
  filter(country == "Finland", year <= 1982) %>%
  select(country, year, pop)

write.csv(gapminder_FL, "gapminder_FL.csv")

#Intro to ggplot2
# you can clean your list of variables using rm(list = ls())

#load ggplot2 library
library(ggplot2)

# it's great for data visualizations, has a steep learning curve, but also makes complex/exploratory data graphics awesome
# based on book grammar of graphic by leeland someone

# scatterplot of lifeexp vs. gdppercap
# aes = aesthetics (mappings between x and y axes to data chosen)
#geom = geometric objects (actual elements in the graph, gives us points for each datapoint)
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) + geom_point()

#different way to do same thing
p <- ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) + geom_point()
p2 <- p + geom_point()
print(p2)

#scaling- give x-axis a log scale, you can just add it to the plot object
p2 <- p + geom_point()+scale_x_log10()
print(p2)

#could also use for same effect
ggplot(gapminder, aes(x=log10(gdpPercap), y=lifeExp)) + geom_point()

#Challenge 1
#make a scatter plot of life exp vs. gdp per cap with data from china

gapminder_CH <- gapminder %>%
  filter(country == "China") %>%
  select(lifeExp, gdpPercap)

ggplot(gapminder_CH, aes(x=gdpPercap, y=lifeExp)) + geom_point()

# piping (%>%) takes output from the command before and uses it in the following command, so you could have done

gapminder %>%
  filter(country == "China") %>%
  ggplot(aes(x=gdpPercap, y=lifeExp)) + geom_point()

# the geom_point() can take additional arguments to change the shape, size, color of the points
# if you put () around the entire set of commands, it will make R run it and plot it

(plot_CH <- gapminder %>%
  filter(country == "China") %>%
  ggplot(aes(x=gdpPercap, y=lifeExp)) + geom_point())

# an aesthetic called "alpha" can change the opacity of the points!!!  COOL
# color example
p <- ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) + geom_point() + aes(color=continent)
plot(p)
#opacity example
p <- ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) + geom_point(alpha=0.5) + aes(color=continent)
plot(p)

#Challenge 2 - try out size shape and color aesthetics with categorical variables and numeric ones
ggplot(gapminder, aes(x=log10(gdpPercap), y=lifeExp), shape=continent) + geom_point(size=5, alpha=0.5) + aes(color=lifeExp)

#plot of china with lines with other aesthetics, note, because ggplot2 uses layers, doing geom_point second
#makes them sit on top of the geom_line
plot_CH <- gapminder %>%
  filter(country == "China") %>%
  ggplot(aes(x=gdpPercap, y=lifeExp)) + geom_line(color="violetred") + geom_point(color="lightblue", size=3)
  plot(plot_CH)

# change color of points to year, but leave line as one color
plot_CH <- gapminder %>%
  filter(country == "China") %>%
  ggplot(aes(x=gdpPercap, y=lifeExp)) + geom_line(color="grey") + geom_point(aes(color=year), size=3)
  plot(plot_CH)

#challenge 3
# make a plot of life exp vs gdppercap for china and india wiht lines in black but points colored by country
#could do filter(country %in% c("China, "India")) or filter(country == "China" | country == "India"
#note can't use a == in the filter case with the vector b/c they have to be equal lengths!  Otherwise, it'll apply that vector of two across the whole country spectrum (272 or so)
#note here the group function allows 
ChinaIndia <- gapminder %>%
  filter(country %in% c("China", "India")) %>%
  ggplot(aes(x=gdpPercap, y=lifeExp, group=country)) + geom_line() + geom_point(aes(color=country), size=3)
  plot(ChinaIndia)

#looking at a histogram file (note set how many bins you want with binwidth and can change color using fill & color
gapminder %>% 
  filter(year==2007) %>%
  ggplot(aes(x=lifeExp)) + geom_histogram(binwidth=5, fill="darkblue", color="orange")

#boxplots
gapminder %>%
  filter(year==2007) %>%
  ggplot(aes(y=lifeExp, x=continent)) + geom_boxplot()

#coord_flip allows you to do the boxplots horintally
gapminder %>%
  filter(year==2007) %>%
  ggplot(aes(y=lifeExp, x=continent)) + geom_boxplot() + coord_flip()

#points instead of boxplots with a bit of jitter to give each column some width
gapminder %>%
  filter(year==2007) %>%
  ggplot(aes(y=lifeExp, x=continent)) + geom_point(position=position_jitter(width=0.1, height=0))

#Faceting- can show you multiple sets of graphs
#facetgrid() and facetgraph() 
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) + geom_point() + scale_x_log10() + facet_grid(~continent) #the tilde tells you to do it vertically
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) + geom_point() + scale_x_log10() + facet_grid(continent~.) #needs something after the ~!
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) + geom_point() + scale_x_log10() + facet_grid(continent~year) #splits by two things
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) + geom_point() + scale_x_log10() + facet_wrap(~continent) #wraps each graph across a page
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp, color=continent)) + geom_point() + scale_x_log10() + facet_wrap(~year) #wraps by year and colored by continent

#CHallenge 3
#select 5 countries and plot lifeexp vs gdpper cap across time with geo_line faceting by country
p<- gapminder %>% filter(country %in% c("China", "India", "Finland", "France", "Germany")) 
head(p)  
ggplot(data=p,aes(y=lifeExp, x=gdpPercap)) + geom_point() + facet_grid(country~year)

# can look for themes that make it just like you like (download library(ggthemes)

#saving plots- put your plot into a variable then use ggsave(location.pdf (or .jpg or .gif), variable)
saveplot <- ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) + geom_point() + scale_x_log10() + facet_grid(~continent)
ggsave("C:/Users/Julie/Documents/wsu_SC/saveplot.pdf", saveplot)













