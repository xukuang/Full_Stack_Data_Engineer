library(rjson)
library(plyr)
library(dplyr)
data.list = fromJSON(file = 'data.JSON') 
class(data.list)
lapply(data.list, 'class')

dat.list1 = do.call('rbind', data.list)
class(dat.list1)
class(dat.list1[,1])

dat.list2 = ldply(data.list,data.frame)
class(dat.list2)
lapply(dat2, 'class')


dat.list3 = bind_rows(data.list)
class(dat.list3)
lapply(dat.list3, 'class')

data.df = lapply(data, as.data.frame)
class(data.df)
lapply(data.df, 'class')
dat.df1 = do.call('rbind', data.df)
class(dat.df1)
lapply(dat.df1, 'class')

dat.df2 = ldply(data.df,data.frame)
class(dat.df2)
lapply(dat.df2, 'class')

dat.df3 = bind_rows(data)
class(dat.df3)
lapply(dat.df3, 'class')
