library(rvest)
library(stringr)
basicURL <- "http://shenzhen.qfang.com/garden"


WebSpider <- function(m){
  url <- str_c(basicURL,"/n",m)
  
  web <- read_html(url,encoding = "UTF-8")
  write
  name <- web %>% html_nodes("p.house-title")  %>%  html_text() #获取小区名
  
  num_sale <- web %>% html_nodes("p.garden-houses.clearfix")  %>% html_text() 
  #获取建造时间，网页代码中层级关系adderess与clearfix有空格，那么就用英文小数点号代替，不能留空
  
  num_sale <- num_sale  %>% str_extract("[0-9]+") %>% as.numeric()

  #str_extract()为stringr包函数；[0-9]+ 为正则表达式，表示多次匹配并抽取数字
  
  address <- web %>% html_nodes("p.garden-address.text.clearfix span") %>% html_text()#小区地址
  

  #合并成数据框
  data.frame(name,num_sale,address)
}

results <- data.frame()
for(m in 1:78){ #78为小区信息的总页码 
  results <- rbind(results,WebSpider(m))#合并每一次循环输出的数据
  
}

write.csv(results, file = 'data/house.csv', row.names = F)
