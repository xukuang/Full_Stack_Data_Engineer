library(plyr)
library(rvest)
library(stringr)
basicurl<-"https://www.amazon.cn/gp/movers-and-shakers/digital-text/"


WebSpider = function(m){
url = str_c(basicurl,"#",m)
web<-read_html(url,encoding="UTF-8")

rank = web %>% html_nodes("div.zg_rankLine span.zg_rankNumber") %>% html_text()
  
title = title %>% str_replace_all('[\n\t]', '') %>% str_trim() %>% str_replace_all(' {2,}', ',')

feature = web %>% html_nodes("p.pl") %>% html_text() %>% str_split(' / ')

author = sapply(feature, function(x)x[1])

publisher = sapply(feature, function(x){ifelse(length(x) ==5, x[3], x[2])})

price = sapply(feature, function(x){ifelse(length(x) ==5, x[5], x[4])})

price = price %>% str_match('[0-9]+')

date = sapply(feature, function(x){ifelse(length(x) ==5, x[4], x[3])})

translator = sapply(feature, function(x){ifelse(length(x) ==5, x[[2]], '')})

rate = web %>% html_nodes("div.star.clearfix span.rating_nums") %>% html_text()

comment = web %>% html_nodes("div.star.clearfix span.pl") %>% html_text() %>% str_match('[0-9]+')

description = web %>% html_nodes("p.quote span.inq") %>% html_text()

result = data.frame(title, author, translator, publisher, date, price, rate, comment, description)

return(result)
}

books <- data.frame() 
for(i in seq(0, 225, by = 25)){ 
  books <- rbind(books, WebSpider(i))#合并每一次循环输出的数据 
  }
write.csv(books, file = 'data/books.csv')
write.table(books, file = 'data/books.txt', sep = '\t', fileEncoding = 'UTF-8')
  