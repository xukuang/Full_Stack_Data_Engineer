library(RMySQL)
library(data.table)
movie = fread('data/douban_movie_clean.txt', sep = '^', encoding = 'UTF-8')
head(movie)
tail(movie)

movie = data.frame(movie)
head(movie)

conn <- dbConnect(RMySQL::MySQL(), username="root", password= 'iae', host="localhost", port=3306, dbname = 'study')

# MySQL连接实例信息
summary(conn, verbose = TRUE)
# 查看数据库的表
dbListTables(conn)

# 建表并插入数据
dbWriteTable(conn,"movie", movie, overwrite = T)
dbSendQuery(conn,'SET NAMES gbk')
mysql=dbGetQuery(conn,"select * from movie")
head(mysql)


## 关闭连接
dbDisconnect(conn)



