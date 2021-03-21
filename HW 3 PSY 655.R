library(psych)
library(readr)
df <- read_delim("Downloads/CFCS_data.csv", 
                 "\t", escape_double = FALSE, 
                 trim_ws = TRUE)
#First -- I reverse score the CFC-immediate 
    #sub-scale questions 
    #Questions cfc3,cfc4,cfc5,cfc9,cfc10,cfc11,cfc12

# Here I reverse score 
columnsToReverse <- c('Q3', 'Q4', 'Q5', 'Q9', 'Q10', 
                      'Q11', 'Q12')
df[,columnsToReverse] <- 6-df[,columnsToReverse]
View(df)

#Second -- omit people where gender=other='3'
df$gender[df$gender == "3"] <- NA

#CFCS avg
CFCS_avg <- c("Q1", "Q2", "Q3", "Q4", "Q5", "Q6",
              "Q7", "Q8", "Q9", "Q10", "Q11", "Q12")

df$CFCS_avg <- rowMeans(df[,CFCS_avg])

df <- cbind(df, df$CFCS_avg)
#Q1_mean <- mean(df$Q1)
#Q2_mean <- mean(df$Q2)
#Q3_mean <- mean(df$Q3)
#Q4_mean <- mean(df$Q4)
#Q5_mean <- mean(df$Q5)
#Q6_mean <- mean(df$Q6)
#Q7_mean <- mean(df$Q7)
#Q8_mean <- mean(df$Q8)
#Q9_mean <- mean(df$Q9)
#Q10_mean <- mean(df$Q10)
#Q11_mean <- mean(df$Q11)
#Q12_mean <- mean(df$Q12)
#CFCS_avg <-c(Q1_mean, Q2_mean, Q3_mean, Q4_mean, Q5_mean,
             #Q6_mean, Q7_mean, Q8_mean, Q9_mean, Q10_mean,
             #Q11_mean, Q12_mean)

# Question 1: does CFCS correlate with age?
cor.test(df$CFCS_avg,
         df$age,)

# Question 2: does CFCS differ between males and females?
df$gender_str <- "Female"
df$gender_str[df$gender == 1] <- "Male"

CFCS_gender_aov <- aov(CFCS_avg~gender_str, data = df)

summary(CFCS_gender_aov)
TukeyHSD(CFCS_gender_aov)

View(df)
