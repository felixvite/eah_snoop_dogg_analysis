library(rtweet)
library(httpuv)
library(dplyr)
library(plyr)
library(psych)
library(ggplot)
library(ggplot2)

auth_setup_default()

# Extract tweets posted by the user @SnoopDogg
get_snoop <- get_timeline("@SnoopDogg", n = 3200)

# View output for the first 5 columns and 10 rows
head(get_snoop[,1:5], 10)

rtwt1 <- get_snoop[,c('created_at', 'id', 'full_text', 'display_text_range', 'retweet_count', 
                      'favorite_count', 'entities')]
rtwt2 <- get_snoop[,c('created_at', 'id', 'full_text', 'display_text_range', 'retweet_count', 
                      'favorite_count')]

for(media in test) {
  media_type = c(media_type, media[["media"]][["type"]])
}

media_type <- media_type[0:3175]
rtwt2$media_type <- media_type
rtwt2$charGroup[rtwt2$display_text_range < 90] <- "small"
rtwt2$charGroup[rtwt2$display_text_range >= 90 & rtwt2$display_text_range < 180] <- "middle"
rtwt2$charGroup[rtwt2$display_text_range >= 90 & rtwt2$display_text_range >= 180] <- "long"

ggplot(data = rtwt2, mapping = aes(created_at, favorite_count, color=media_type)) + geom_point()
ggplot(data = rtwt2, mapping = aes(created_at, retweet_count, color=media_type)) + geom_point()
ggplot(data = rtwt2, mapping = aes(created_at, favorite_count, color=charGroup)) + geom_point()
ggplot(data = rtwt2, mapping = aes(created_at, retweet_count, color=charGroup)) + geom_point()
               
write.csv(rtwt2, "SnoopDogg.csv")
