gapminder <- read.csv ("gapminder.csv")
#Countries w/ countries > 80
gapminder[gapminder$lifeExp >80, "country"]