
sites <- rgdal::readOGR("/Users/clairedavis/Data/Credible Carbon/Credible Carbon Sites.geojson")

library(leaflet)

sites$labels <- paste0(
  "<strong> Project Name: </strong> ",
  sites$Project.Name, "<br/> "
) %>%
  lapply(htmltools::HTML)

leaflet(sites) %>%
  addTiles() %>%
  addMarkers(data=sites, label = ~labels)

#circle markers
leaflet(sites) %>%
  addTiles() %>%
  addCircleMarkers(data=sites, label = ~labels,
                   radius = 6,
                   color = "navy",
                   stroke = FALSE, fillOpacity = 0.8)

library(ggplot2)
ggplot(data = sites@data, mapping=aes(x = YearStarted, y = Project.Name.)) + geom_point()

library(plotly)
fig <- plot_ly(data = sites@data, x = ~Credits.Available, y = ~Project.Name)
fig


