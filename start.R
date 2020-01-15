library(ggplot2)
library(dplyr)
install.packages("mapproj")

WorldData <- map_data('world') %>% filter(region != "Antarctica") %>% fortify

df <- data.frame(region=c('Australia','Germany','Russia','Poland','Marocco'), 
                 value=c(10,10,10,10,10), 
                 stringsAsFactors=FALSE)

p <- ggplot() +
  geom_map(data = WorldData, map = WorldData,
           aes(x = long, y = lat, group = group, map_id=region),
           fill = "lightgrey", colour = "white", size=0.5) + 
  geom_map(data = df, map=WorldData,
           aes(fill=value, map_id=region),
           colour="#7f7f7f", size=0.5) +
  coord_map("rectangular", lat0=0, xlim=c(-180,180), ylim=c(-60, 90)) +
  scale_fill_continuous(low="#c3c3c3", high='#c3c3c3') +
  scale_y_continuous(breaks=c()) +
  scale_x_continuous(breaks=c()) +
  theme_classic() +
  theme(legend.position = "none")
print(p)
