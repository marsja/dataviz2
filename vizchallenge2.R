require(ggplot2)
require(readr)
require(dplyr)
require(gghighlight)

full_trains <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-02-26/full_trains.csv")

full_trains %>%
  ggplot(aes(journey_time_avg, fill=service)) +
  geom_histogram(fill='red', bins = 20, alpha=.8) + 
  gghighlight(service == 'National', unhighlighted_colour = alpha('grey', .6),
              use_group_by = F) +
  ggtitle('Histogram of Average Journey time for trains on the SNCF Network',
          subtitle = 'National Service trains highlighted in red') +
  xlab('Journey Time (mins.)') +
  ylab('Number of instances')