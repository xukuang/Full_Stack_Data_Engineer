library(tidytext)
library(dplyr)
library(stringr)
fw = readLines('data/xyj.txt', encoding = 'UTF-8')
fw.real = str_trim(fw)
fw_df = data_frame(text = fw.real)
fw_df
result = fw_df %>%
  unnest_tokens(ch, text, token = 'characters') %>% group_by(ch) %>% summarise(num = n()) %>% arrange(desc(num))

write.csv(result, 'data/result_r_1.csv', row.names = F)
write.csv(result, 'data/result_r_utf8_1.csv', row.names = F,fileEncoding = 'UTF-8')
