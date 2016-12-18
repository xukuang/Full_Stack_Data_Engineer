library(data.table)
library(ggplot2)

movies = fread('data/douban_movie_clean.txt', sep = '^', header = TRUE, encoding = 'UTF-8')

head(movies)
nrow(movies)

movies = movies[!is.na(movies$length)]
class(movies)

## 直方图
ggplot(movies) + geom_histogram(aes(x=length))

## 条形图
BOD
ggplot(BOD) + geom_bar(aes(x = Time, y = demand), stat = 'identity')


library('gcookbook')
cabbage_exp
ggplot(cabbage_exp) + geom_bar(aes(x= Cultivar))
ggplot(cabbage_exp) + geom_bar(aes(x= Cultivar, y = Weight), stat = 'identity')

ggplot(cabbage_exp) + geom_bar(aes(x= Cultivar, y = Weight, fill = Date), stat = 'identity')

ggplot(cabbage_exp) + geom_bar(aes(x= Cultivar, y = Weight, fill = Date), stat = 'identity', position = 'dodge')

## 折线图
ggplot(BOD, aes(x = Time, y= demand)) + geom_line() + geom_point() + geom_area()

us = uspopage
ggplot(us) + geom_line(aes(x=Year, y= Thousands))
ggplot(us) + geom_line(aes(x=Year, y= Thousands, color = AgeGroup))

ggplot(us) + geom_area(aes(x=Year, y= Thousands, fill = AgeGroup))

ggplot(us) + geom_line(aes(x=Year, y= Thousands)) + facet_wrap(~AgeGroup)
write.csv(movies, 'movies.csv')

