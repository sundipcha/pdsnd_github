
ny = read.csv('new_york_city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')

head(ny)

head(wash)

head(chi)

library(ggplot2)

#we know the median year for subscribers is 1981 and for customers is 1986. 
#we can then infer that, the most frequent bikers are probably in their 30s.
summary(2019 - ny$Birth.Year)

ggplot(aes(x = 2019 - Birth.Year), data = ny) +
    geom_histogram(binwidth = 5, color = 'black', fill = '#F79420') +
    scale_x_continuous(breaks=seq(0,100,5)) +
    theme(axis.text.x=element_text(angle=45,hjust=1)) +
    ggtitle('Age vs Biker Preference') +
    xlab('Age') +
    ylab('Number of Bikers')

#Take a look at duration distribution for customers in Chicago.
summary(chi$Trip.Duration / 60)

ggplot(aes(x= Trip.Duration / 60 ), data=chi) +
  geom_histogram(binwidth= 5) +
  scale_x_continuous(limits=c(0,50)) + 
  ggtitle('Trip Duration breakoution Chicago') +
  xlab('Minutes') +
  ylab('Number of Bikers') 

#note there is a 1 in the database when you look at User.Type, we will keep this value in the graph for
#this exercise
by(wash$Trip.Duration / 60 , wash$User.Type, summary)

qplot(x = User.Type, y = Trip.Duration/60, 
      data = subset(wash, !is.na(User.Type)), 
      geom = 'boxplot') +
      coord_cartesian(ylim = c(0,50)) +
      ggtitle('Washington Biker Customer vs Subscriber Median Bike Time') +
      xlab('Type of Bikers') +
      ylab('Time of Duration in Minutes')+
      geom_point(na.rm = TRUE)
  

system('python -m nbconvert Explore_bikeshare_data.ipynb')
