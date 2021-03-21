scatter <- ggplot(examData, aes(Anxiety, Exam))
#Scatter with linear regression line
scatter + geom_point() + geom_smooth(method = "lm", colour="Red") + 
  labs(x = "Exam Anxiety", y = "Exam Performance %")

#geom_point = the data points. geom = 

#Scatter with smoothed regressoion line
scatter <- ggplot(examData, aes(Anxiety, Exam))scatter + geom_point()
                                + geom_smooth() + labs(x = 
                                "Exam Anxiety", y = "Exam Performance %")


#Group scatter plot
scatter <- ggplot(examData, aes(Anxiety, Exam, colour = 
                Gender))scatter + geom_point() 
                + geom_smooth(method = "lm", aes(fill = Gender),
                alpha = 0.1) + labs(x = "Exam Anxiety", 
               y = "Exam Performance %", colour = "Gender")



#Histograms
#Create the plot objecy
festivalHistogram <- ggplot(festivalData, aes(day1)) + 
  opts(legend.position = "none")

#Add the graphical layer
festivalHistogram + geom_histogram(binwidth = 0.4 ) + 
  labs(x = "Hygiene (Day 1 of Festival)", y = "Frequency")

#BOX PLOTS
#Show -- the median, upper and lower quartile, limits within which
#the middle 50% scores lie
festivalBoxplot <- ggplot(festivalData, aes(gender, 
                  day1))festivalBoxplot + geom_boxplot() + 
                  labs(x = "Gender", 
                  y = "Hygiene (Day 1 of Festival)")



#Bar chart
bar <- ggplot(chickFlick, aes(film, arousal))
bar + stat_summary(fun.y = mean, geom = "bar", 
                   fill = "White", colour = "Black")

#Add error bars
+ stat_summary(fun.data = mean_cl_normal, geom = "pointrange")
+ labs(x = "Film", y = "Mean Arousal")


               
