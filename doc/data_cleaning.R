
lyric<-read.csv('C:/Users/59482/Desktop/Columbia/Second Term/ads/project1/Spring2020-Project1-JinxiaoDu/data/lyrics.csv',stringsAsFactors = FALSE)


library(dplyr)
lyric<-lyric %>%
  filter(!is.na(lyrics)&!(genre %in% c('Not Available','Other'))& year>=1970)


library(tidytext)
library(textdata)

lyric$lyrics <- tolower(lyric$lyrics)

lyric$lyrics <- gsub("[^0-9A-Za-z///' ]", "", lyric$lyrics)


lyric_not_sum<-lyric %>%
  unnest_tokens(word,lyrics) %>%
  inner_join(get_sentiments("nrc"),by='word') 
write.csv(lyric_not_sum,"C:/Users/59482/Desktop/Columbia/Second Term/ads/project1/Spring2020-Project1-JinxiaoDu/output/lyric_not_sum.csv",row.names = FALSE)