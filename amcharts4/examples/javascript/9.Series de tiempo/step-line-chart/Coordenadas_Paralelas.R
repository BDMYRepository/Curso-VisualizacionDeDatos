




install.packages("tidyverse")
install.packages("hrbrthemes")
install.packages("patchwork")
install.packages("GGally")
install.packages("viridis")

library(tidyverse)
library(hrbrthemes)
library(patchwork)
library(GGally)
library(viridis)


read.csv("diamonds.csv", header = TRUE) -> data

data %>% 
  sample_n(10) %>%
    ggparcoord(
      columns = c(1,5:7), 
      groupColumn = 2, 
      #order = "anyClass",
      showPoints = TRUE, 
      title = "Diamonds features",
      alphaLines = 0.3
      ) + 
    scale_color_viridis(discrete=TRUE) + #cambia la escala de color para cambiar el color de las lineas
    theme_ipsum()+ ###Cambia el tema para cambiar los fondos
    theme(
      plot.title = element_text(size=10)
    )