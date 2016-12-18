library(stringr)
library(dplyr)
fw = readLines('data/xyj.txt', encoding = 'UTF-8')
fw.real = str_trim(fw)
fw.real = fw.real[!fw.real == '']
fw.list = str_split(fw.real, '')
single = data.frame(ch = do.call('c',fw.list))
result = single %>% group_by(ch) %>% summarise(num = n()) %>% arrange(desc(num))

write.csv(result, 'data/result_r.csv', row.names = F)
write.csv(result, 'data/result_r_utf8.csv', row.names = F,fileEncoding = 'UTF-8')
