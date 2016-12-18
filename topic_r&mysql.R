library(RMySQL)
seedling = read.csv('data/seed_inf.csv', fileEncoding = 'UTF-8')
head(seedling)
tail(seedling)

conn <- dbConnect(RMySQL::MySQL(), username="root", password= 'iae', host="localhost", port=3306, dbname = 'study')

# MySQL连接实例信息
summary(conn, verbose = TRUE)

# 建表并插入数据
dbWriteTable(conn,"seedling", seedling, overwrite = T)
# 插入新数据
dbWriteTable(conn, "seedling", seedling, append=TRUE)

# 查看数据库的表
dbListTables(conn)

# 删除表
# 建表并插入数据
dbWriteTable(conn,"temp", seedling, overwrite = T)
# 查看数据库的表
dbListTables(conn)
dbRemoveTable(conn, "temp")
dbListTables(conn)



# 查看表的字段
dbListFields(conn, "seedling")


dbSendQuery(conn,'SET NAMES gbk')



mysql=dbGetQuery(conn,"select * from seedling")
head(mysql)

seedling0 <- dbGetQuery(conn, "SELECT * FROM seedling where seed > 0")
head(seedling0)

# 单行记录的添加
#dbSendQuery(conn,"INSERT INTO t_blog(title,author,length) values('R插入的新文章','Conan',50)")

## 关闭连接
dbDisconnect(conn)



