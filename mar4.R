library(psych)
library(readr)
df_fps <- read_delim("Downloads/FPS_data.csv", 
                     "\t", escape_double = FALSE, trim_ws = TRUE)
View(df_fps)

meanQ4 <- colSums(df_fps[,c('Q1', 'Q4')])
df_fps <- cbind(df_fps, meanQ4)
View(df_fps)

#Machsum
sums <- c("name", "of", "each", "column")
df$sums <- rowSums(df[sums])
df <- cbind(df, means)
