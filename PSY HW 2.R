library(psych)
library(readr)
df <- read_delim("Documents/PSY 655/MACH_data.csv", 
                 "\t", escape_double = FALSE, trim_ws = TRUE)

# Reverse scoring #dam 
columnsToReverse <- c('Q3A', 'Q4A', 'Q6A', 'Q7A', 'Q9A', 
                      'Q10A', 'Q11A', 'Q14A', 'Q16A', 'Q17A')
df[,columnsToReverse] <- 6-df[,columnsToReverse]


#Machivellian sum
Machivelliansum <- c("Q1A", "Q2A", "Q3A", 
                       "Q4A", "Q5A", "Q6A",
                       "Q7A", "Q8A", "Q9A", 
                       "Q10A", "Q11A", "Q12A",
                       "Q13A", "Q14A", "Q16A", 
                       "Q17A", "Q18A", "Q19A", 
                       "Q20A")

df$Machivelliansum <- rowSums(df[,Machivelliansum])
df <- cbind(df, df$Machivelliansum)
View(df)


#| = or

#Recoding the religion variable
#simply indicates whether a participant is 
#(1) an atheist or agnostic, (2) a Christian, 
#or (3) non-Christian religious.
religion_function <- function(religion) {
  if (religion == 1 | religion == 2) {
    return(1)
  }
  else if (religion == 4 | religion == 5 | religion == 6 | 
           religion == 7) {
    return(2)
  }
  else if (religion == 3 | religion == 8 | religion == 9 | 
           religion == 10 | religion == 11 | religion == 12) {
    return(3)
  }
}