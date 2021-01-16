# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #  
# # # # USO DEL COLOR
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# I. Seleccionando el color con nombres o con código hexadecimal:
# Lista de nombres de colores en librerías básicas de R. 
# Ver también https://www.datanovia.com/en/blog/awesome-list-of-657-r-color-names/
r_color <- colors(distinct=TRUE)
head(r_color, 10)

colors()

library(ggplot2)
# Usando un único color para todos los grupos:
ggplot(iris, aes(x=Species, y=Sepal.Length)) + 
		geom_boxplot(width=0.5, outlier.size=1.5, outlier.shape=21, fill = "turquoise", color = "black")

# Si conoces el código hexadecimal:				
ggplot(iris, aes(x=Species, y=Sepal.Length)) + 
		geom_boxplot(width=0.5, outlier.size=1.5, outlier.shape=21, fill = "#FFDB6D", color = "#C4961A")

		
# II. Paleta de la librería 'viridis':
library(viridis)
library(scales)

show_col(viridis_pal()(20))

col.viridis<-viridis(30, alpha = 1, begin = 0, end = 1, direction = 1)
show_col(col.viridis)

col.magma<-magma(30, alpha = 1, begin = 0, end = 1, direction = 1)
show_col(col.magma)

col.inferno<-inferno(30, alpha = 1, begin = 0, end = 1, direction = 1)
show_col(col.inferno)

col.plasma<-plasma(30, alpha = 1, begin = 0, end = 1, direction = 1)
show_col(col.plasma)

col.cividis<-cividis(30, alpha = 1, begin = 0, end = 1, direction = 1)
show_col(col.cividis)

# Paleta viridis en gráficos XY:
# Usando colores en gradiente continuo i.e. con los valores de una variable continua (argumento 'discrete=FALSE').
# La opción (A,B,C,D,E) permite escoger una de las 5 paletas de viridis:
ggplot(iris, aes(Sepal.Length, Sepal.Width))+
  	geom_point(aes(color = Sepal.Length)) +
  	scale_color_viridis(option = "B")

# Usando colores distintos para cada grupo i.e. con los valores de una variable categórica (argumento 'discrete=TRUE').
ggplot(iris, aes(Sepal.Length, Sepal.Width))+
  	geom_point(aes(color = Species)) +
  	geom_smooth(aes(color = Species, fill = Species), method = "loess") + 
  	scale_color_viridis(discrete = TRUE, option = "C")+
  	scale_fill_viridis(discrete = TRUE, option = "C") 

# En diferentes facetas:
ggplot(iris, aes(Sepal.Length, Sepal.Width))  +
  geom_point(aes(color = Species)) +
  geom_smooth(aes(color = Species, fill = Species), se=TRUE, span = 0.8) +
  scale_color_viridis(discrete = TRUE, option = "C")+
  scale_fill_viridis(discrete = TRUE, option = "C")+
  facet_wrap(~Species)
 
     	
# III. Paleta de la librería 'RColorBrewer':
library(RColorBrewer)
display.brewer.all()
# 1. Sequential palettes (first list of colors), which are suited to ordered data that progress from low to 
# high (gradient). The palettes names are : Blues, BuGn, BuPu, GnBu, Greens, Greys, Oranges, OrRd, PuBu,
# PuBuGn, PuRd, Purples, RdPu, Reds, YlGn, YlGnBu YlOrBr, YlOrRd.
# 
# 2. Qualitative palettes (second list of colors), which are best suited to represent nominal or categorical
# data. They not imply magnitude differences between groups. The palettes names are : Accent, Dark2, Paired,
# Pastel1, Pastel2, Set1, Set2, Set3.
# 
# 3. Diverging palettes (third list of colors), which put equal emphasis on mid-range critical values and extremes
# at both ends of the data range. The diverging palettes are : BrBG, PiYG, PRGn, PuOr, RdBu, RdGy, RdYlBu,
# RdYlGn, Spectral.

display.brewer.pal(9, "Blues")
display.brewer.pal(9, "YlGn")

display.brewer.pal(8, "Accent")
display.brewer.pal(8, "Set2")

display.brewer.pal(11, "PiYG")
display.brewer.pal(11, "PuOr")

brewer.pal(11, "PiYG")
show_col(brewer.pal(11, "PiYG"))

# Usando un único color para todos los grupos:
ggplot(iris, aes(Species, Sepal.Length)) + 
  geom_boxplot(fill = "#C51B7D" , color = "#276419", alpha=0.8) +
  theme_minimal()

# Usando colores distintos para cada grupo, hay dos funciones 'scale' para el uso de las paletas de RColorBrewer:
# 1. Para gráficos de cajas (box plots), barras (bar plots), histogramas, violin, dispersion (dot plots), etc:
# 'scale_fill_brewer()'  
ggplot(iris, aes(Species, Sepal.Length)) + 
  		geom_boxplot(aes(fill = Species)) +
  		scale_fill_brewer(palette = "Accent")+
  		theme_bw() +
  		theme(legend.position = "right")
  
ggplot(iris, aes(Species, Sepal.Length)) + 
	    geom_violin(aes(fill = Species)) + 
		scale_fill_brewer(palette = "Accent")+
  		theme_bw() +
  		theme(legend.position = "right")
  		
ggplot(iris, aes(x=Sepal.Length, fill=Species)) +
	   geom_histogram(position="identity", alpha=0.8)+
	   scale_fill_brewer(palette = "Set2")
	   
barplot(c(2,5,7), col = brewer.pal(n = 3, name = "RdBu"))  		

# 2. Para gráficos de lineas y puntos:	   
# 'scale_color_brewer()' 
ggplot(iris, aes(Sepal.Length, Sepal.Width)) + 
  		geom_point(aes(color = Species), size = 3) +
  		scale_color_brewer(palette = "Paired")+
  		theme_minimal()+
  		theme(legend.position = "top")

ggplot(iris, aes(Sepal.Length, Sepal.Width))+
  		geom_point(aes(color = Species)) +
  		geom_smooth(aes(color = Species, fill = Species), method = "lm") + 
  		scale_color_brewer(palette = "Dark2")+
  		scale_fill_brewer(palette = "Dark2")   		
  		
  		
# IV. Paleta de la librería 'ggsci' (sicentific journal color palette):
library(ggsci)
# Las funciones para las distintas paletas son:
# 1) scale_color_npg() and scale_fill_npg(): Nature Publishing Group color palettes
# 2) scale_color_aaas() and scale_fill_aaas(): American Association for the Advancement of Science color palettes
# 3) scale_color_lancet() and scale_fill_lancet(): Lancet journal color palettes
# 4) scale_color_jco() and scale_fill_jco(): Journal of Clinical Oncology color palettes
# 5) scale_color_tron() and scale_fill_tron(): This palette is inspired by the colors used in Tron Legacy. 
#    It is suitable for displaying data when using a dark theme.

ggplot(iris, aes(Sepal.Length, Sepal.Width))+
  		geom_point(aes(color = Species)) +
  		geom_smooth(aes(color = Species, fill = Species), method = "lm") + 
  		scale_color_lancet()+
  		scale_fill_lancet() 
  		
ggplot(iris, aes(Species, Sepal.Length)) + 
	    geom_violin(aes(fill = Species)) + 
		scale_fill_jco()+
  		theme_bw() +
  		theme(legend.position = "right")
  
  				
# V. Paleta con escala de grises:
# La funciones son:
# 1. scale_fill_grey() Para gráficos de cajas (box plots), barras (bar plots), histogramas, violin, etc
ggplot(iris, aes(Species, Sepal.Length)) + 
	    geom_violin(aes(fill = Species)) + 
		scale_fill_grey(start = 0.8, end = 0.2)+
  		theme_bw() +
  		theme(legend.position = "right")
  		 
# 2. scale_colour_grey() Para gráficos XY y de lineas.
ggplot(iris, aes(Sepal.Length, Sepal.Width))+
  		geom_point(aes(color = Species)) +
  		geom_smooth(aes(color = Species, fill = Species), method = "lm") + 
  		scale_color_grey(start = 0.8, end = 0.2) +
  		scale_fill_grey(start = 0.8, end = 0.2)  		 

  		
# V. Paleta indicada de manera manual (debes conocer el nombre o codigo hexadecimal del color):
# Usando colores distintos para cada grupo:
ggplot(iris, aes(Sepal.Length, Sepal.Width)) +
  	geom_point(aes(shape = Species, color = Species), size = 3) +
  	scale_shape_manual(values = c(18, 16, 17)) +
  	scale_color_manual(values = c("#8E0152", "#F1B6DA", "#7FBC41"))+
  	theme_minimal() +
  	theme(legend.position = "top")

# Usando colores en gradiente continuo: 	
ggplot(iris, aes(Sepal.Length, Sepal.Width)) +
  	geom_point(aes(shape = Species, color = Sepal.Length), size = 3) +
  	scale_shape_manual(values = c(18, 16, 17)) +
  	scale_color_gradient(low = "blue", high = "red")+
  	theme_minimal() +
  	theme(legend.position = "right")  
  	
# Definir manualmente la paleta que se quiere visualizar:
custom.col <- c("#FFDB6D", "#C4961A", "#F4EDCA", "#D16103", "#C3D7A4", "#52854C", "#4E84C4", "#293352", "#FF1234")
show_col(custom.col)

# Funcion en R para visualizar una paleta (como barras verticales) de colores definida:
show_pal <- function(pal) {
   df <- data.frame(x = pal, y = 1)

ggplot2::ggplot(df, ggplot2::aes(x = x, y = y, fill = x, color = x)) +
     ggplot2::geom_bar(stat = "identity") +
     ggplot2::scale_color_manual(values = pal) +
     ggplot2::scale_fill_manual(values = pal) +
     ggplot2::theme_void() +
     ggplot2::theme(legend.position = "none") +
     ggplot2::ggtitle(deparse(substitute(pal)))
 }
 
show_pal(custom.col) 
