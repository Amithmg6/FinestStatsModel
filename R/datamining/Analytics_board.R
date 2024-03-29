---
  title: "HTML Widgets Showcase"
output: 
  flexdashboard::flex_dashboard:
  storyboard: true
social: menu
source: embed
---
  
  ```{r setup, include=FALSE}
library(flexdashboard)
```

### Leaflet is a JavaScript library for creating dynamic maps that support panning and zooming along with various annotations.

```{r}
library(leaflet)
leaflet() %>%
  addTiles() %>%
  addMarkers(lng=174.768, lat=-36.852, popup="The birthplace of R")
```

***
  
  https://rstudio.github.io/leaflet/
  
  - Interactive panning/zooming

- Compose maps using arbitrary combinations of map tiles, markers, polygons, lines, popups, and GeoJSON.

- Create maps right from the R console or RStudio

- Embed maps in knitr/R Markdown documents and Shiny apps

- Easily render Spatial objects from the sp package, or data frames with latitude/longitude columns

- Use map bounds and mouse events to drive Shiny logic


### d3heatmap creates interactive D3 heatmaps including support for row/column highlighting and zooming.

```{r}
library(d3heatmap)
d3heatmap(mtcars, scale="column", colors="Blues")
```

***
  
  https://github.com/rstudio/d3heatmap/
  
  - Highlight rows/columns by clicking axis labels

- Click and drag over colormap to zoom in (click on colormap to zoom out)

- Optional clustering and dendrograms, courtesy of base::heatmap


### Dygraphs provides rich facilities for charting time-series data in R and includes support for many interactive features.

```{r}
library(dygraphs)
dygraph(nhtemp, main = "New Haven Temperatures") %>% 
  dyRangeSelector(dateWindow = c("1920-01-01", "1960-01-01"))
```

***
  
  https://rstudio.github.io/dygraphs/
  
  - Automatically plots xts time series objects (or any object convertible to xts).

- Highly configurable axis and series display (including optional second Y-axis).

- Rich interactive features including zoom/pan and series/point highlighting.

- Display upper/lower bars (e.g. prediction intervals) around series.
- Various graph overlays including shaded regions, event lines, and point annotations.


### Plotly provides bindings to the plotly.js library and allows you to easily translate your ggplot2 graphics into an interactive web-based version.

```{r}
library(plotly)
p <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) +
  geom_bar(position = "dodge")
ggplotly(p)
```

***
  
  https://plot.ly/ggplot2/
  
  If you use ggplot2, `ggplotly()` converts your plots to an interactive, web-based version! It also provides sensible tooltips, which assists decoding of values encoded as visual properties in the plot.

plotly supports some chart types that ggplot2 doesn't (such as 3D surface, point, and line plots). You can create these (or any other plotly) charts using `plot_ly()`.


### MetricsGraphics enables easy creation of D3 scatterplots, line charts, and histograms.

```{r}
library(metricsgraphics)
mjs_plot(mtcars, x=wt, y=mpg) %>%
  mjs_point(color_accessor=carb, size_accessor=carb) %>%
  mjs_labs(x="Weight of Car", y="Miles per Gallon")
```

***

https://hrbrmstr.github.io/metricsgraphics/

Building metricsgraphics charts follows the “piping” idiom made popular through the magrittr, ggvis and dplyr packages. This makes it possible to avoid one giant function with a ton of parameters and facilitates breaking out the chart building into logical steps. 

While MetricsGraphics.js charts may not have the flexibility of ggplot2, you can build functional, interactive [multi-]line, scatterplot, bar charts & histograms and + even link charts together.