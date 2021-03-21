library(haven)
df <- read_sav("Downloads/glbwarm.sav")
View(df)

df$partyid_str <- "Independent"
df$partyid_str[df$partyid == 1] <- "Democrat"
df$partyid_str[df$partyid == 2] <- "Republican"

table(df$partyid_str)

climate_party_aov <- aov(govact~partyid_str, df)
summary(climate_party_aov)
TukeyHSD(climate_party_aov)

library(car)
levenetest(climate_party_aov, center = mean)
hist(df$govact)


#eta squared simelar to r squared valu
etaSquared(climate_party_aov)

TukeyHSD(climate_party_aov)

df$sex_str <- "Female"
df$sex_str[df$sex == 1] <- "Male"

climate_party_sex_aov <- aov(govact~partyid_str
                             +sex_str, partyid_str*sex_str, data = df)

summary(climate_party_sex_aov)
TukeyHSD(climate_party_sex_aov)


library(haven)
df <- read_sav("Downloads/caskets.sav")
View(df)

df$policy_str <- "Not told"
df$policy_str[df$policy == 1] <- "Told"

df$kerry_str <- "Does not"
df$kerry_str[df$kerry == 1] <- "Does"

told_kerry_aov <- aov(interest~policy_str, kerry_str,policy_str*kerry_str,
                      df)
summary(told_kerry_aov)


library(apaTables)



##### NEW EXAMPLE
library(readr)
df <- read_csv("Downloads/album_sales.csv")
View(df)

cor.test(df$adverts, df$sales)
apa.cor.table(df, "corr_table.doc")

Model1 <- lm(sales~adverts, df)
Model2 <- lm(sales~adverts+airplay, df)
Model3 <- lm(sales~adverts+airplay+attract, df)


summary(Model1)
summary(Model2)
summary(Model3)


# This can be used to compare the significance between the models
# so it will run an anova between the 3 models
anova(Model1, Model2, Model3)


