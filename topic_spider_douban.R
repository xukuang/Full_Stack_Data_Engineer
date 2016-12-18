## ≈¿≥Ê ±º‰£∫2016-12-14

library(rvest)
library(rjson)
library(stringr)
library(dplyr)


url = 'https://movie.douban.com/j/search_tags?type=movie'
web <- read_html(url,encoding="UTF-8")
tags <- web %>% html_nodes('p') %>% html_text() %>% fromJSON()
tag = tags$tags

basicurl<-"https://movie.douban.com/j/search_subjects?type=movie&tag="

WebSpider = function(m){
  i = 0
  result = data.frame()
  while(1){
    #Sys.sleep(runif(1,1,2))
    url = str_c(basicurl,m,'&sort=recommend&page_limit=20&page_start=', i)
    web<-read_html(url,encoding="UTF-8")
    
    movies.inf = web %>% html_nodes("p") %>% html_text() %>% fromJSON()
    temp = do.call("rbind",movies.inf$subjects)
    
    result = rbind(result, temp)
    if(is.null(temp)){
      print(i);break} else{
        i = i + 1} 
  }
  
  result$tags = m
  return(result)
}

movies <- data.frame()

for(j in 1:length(tag)){
  movies <- rbind(movies, WebSpider(tag[j]))}

movies.df = lapply(movies, as.character)
movies.unique = movies.df %>% tbl_df() %>% distinct(id, .keep_all = T)

write.csv(movies.df, file = 'data/douban_movies_R.csv', row.names = F)
write.csv(movies.unique, file = 'data/douban_movies_unique_R.csv', row.names = F)
