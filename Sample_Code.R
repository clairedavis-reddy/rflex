setwd("/home/rstudio/dashboard/")

sites <- read.csv("data.csv")

# mapping a map with circle markers
library(leaflet)
sites$labels <- paste0(
  "<strong> Project Name: </strong> ",
  sites$Project.Name, "<br/> "
) %>%
  lapply(htmltools::HTML)

leaflet(sites) %>%
  addTiles() %>%
  addCircleMarkers(data=sites, label = ~labels,
                   radius = 6,
                   color = "navy",
                   stroke = FALSE, fillOpacity = 0.8)

# Create a plot of the credits available per project
fig <- plot_ly(sites, x = ~Project.Name, y = ~Credits.Available, type='bar', color = I("darkgreen"),name='Carbon Credit Projects')
fig <- fig %>% add_trace(y = ~Credits.Sold, name = 'Credits Sold',color = I("lightblue"))
fig <- fig %>% layout(yaxis = list(title = 'Count'), barmode = 'stack')
fig
