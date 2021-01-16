# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #  
# # # # DIAGRAMAS DE CORRELACION Y MATRICES DE GRAFICOS XY
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Datos son conteos de fregatas (Fregata minor) en varias islas del Pacífico SW, y su relación con y su 
# relación con una serie de variables ambientales. Las variables son: area: area de la isla; dist: 
# distancia media al continente; ldist: máxima distancia al continente; a.aisl: años transcurrido en aislamiento;
# impac: nivel de impacto antropogénico; altsnm: altura sobre nivel del mar.
# Descrbir las relaciones que guarda la abundancia de fregatas con las variables ambientales, entre estas últimas.
# Preguntas: ¿cuáles variables están más fuertemente asociadas a la abundancia de fregatas? ¿Cuáles variables están
# 			  vas fuertemente asociadas entre si? ¿cuáles lo están menos?
# Datos: ceja 'aves' en exel 'datosViz.xlsx' 

dat<-read.delim(file.choose(), head=T)
str(dat)

# I Para hacer diagramas de correlación vamos a usar la librería 'corrplot'. Las funciones de esta libreria actuan sobre
# una matriz de correlaciones entre todos los pares de variable. Esto se logra con la función 'cor'.
library(corrplot)

# Aqui está dicha matriz con los valores redondeados a 2 decimales.
mcor<-round(cor(dat),2)

# La función 'corrplot' obtiene el diagrama. 
corrplot(mcor)

# Esta función tiene muchos argumentos. Aquí solo hay algunos para generar un mosaico de sombreados con las leyendas
# de las variables en los ejes en negro e inclinados 45o.
corrplot(mcor, method="shade", shade.col=NA, tl.col="black", tl.srt=45)

# Se puede escoger una paleta de colores distintos que luego será usada en gradiente de colores con 'col=(col(200))'.
col<-colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))

# Se puede adicionar los valores de correlacion en negro y ordenarlos para que estén juntos aquellas variables más
# feurtemente asociadas ('AOE?). También puedes quitar la leyenda de la paleta de correlación.
corrplot(mcor, method="shade", shade.col=NA, tl.col="black", tl.srt=45,
	     col=col(200), addCoef.col="black", cl.pos="n", order="AOE")
	     
corrplot(mcor, method="shade", shade.col=NA, tl.col="black", tl.srt=45,
	     col=col(200), addCoef.col="grey", cl.pos="n", order="AOE")

corrplot(mcor, method="shade", shade.col=NA, tl.col="black", tl.srt=45,
	     col=col(200), addCoef.col="black", order="AOE")
	     
corrplot(mcor, method="shade", shade.col=NA, tl.col="black", tl.srt=45,
	     col=col(200), addCoef.col="black", cl.pos="n")
	     
	     
# II Para hacer una matriz de scatterplots se usa la función 'pairs' de la libreria básica 'graphics'. Estos
# gráficos sólo tienen interpretación al aplicarse a variables continuas o discretas cuantitativas (no sobre
# categroría, factores o variables ordinales). Por eso, eliminaremos la variable impa del juego de datos.
dat.c<-dat[,-6]
pairs(dat.c)

# Las escalas en las que fueron medidas las variables no permiten observar con claridad las relaciones entre sí.
# Los datos de area, distancia y máxima distancia están agolpados en un extremos de las gráficas XY. Para corregir
# las escalas y poder observar mejor las correlaciones entre variables, se transforman estas tres varaibles a su
# logaritmo:	     
dat.ct<-data.frame(abund=dat$abund, logarea=log(dat$area), logdist=log(dat$dist),
					logldist=log(dat$ldist), a.aisla=dat$a.aisla, altsnm=dat$altsnm)
					
pairs(dat.ct)

# Es posible utilizar los paneles de la diagonal para generar histogramas de frecuencia de cada variable; también
# se pueden usar los paneles sobre la diagonal para poner los valores de correlación de Pearson; y los paneles de
# abajo de la diagonal para los graficos XY con un suavizador o una linea recta. Para ello es necesario definir y 
# correr estas funciones en tu sesión de la consola (para mas informacion consulta la funcion 'pairs').

# Definir función 'panel.hist' para hacer histogramas
panel.hist <- function(x, ...)
{
    usr <- par("usr"); on.exit(par(usr))
    par(usr = c(usr[1:2], 0, 1.5) )
    h <- hist(x, plot = FALSE)
    breaks <- h$breaks; nB <- length(breaks)
    y <- h$counts; y <- y/max(y)
    rect(breaks[-nB], 0, breaks[-1], y, col = "white", ...)
}

# Definir función 'panel.cor' para poner los valores de correlacion de Pearson
panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...)
{
    usr <- par("usr"); on.exit(par(usr))
    par(usr = c(0, 1, 0, 1))
    r <- abs(cor(x, y,, use="complete.ob"))
    txt <- format(c(r, 0.123456789), digits = digits)[1]
    txt <- paste(prefix, txt, sep="")
    if(missing(cex.cor)) cex.cor <- 0.8/strwidth(txt)
    text(0.5, 0.5, txt, cex = cex.cor *(1 + r)/2)
}

# Definir función 'panel.lm' para poner lineas rectas a los datos
panel.lm<-function (x, y, col = par("col"), bg =NA, pch = par ("pch"),
					cex = 1, col.smooth = "red", ...) 
{
	points(x, y, pch = pch, col = col, bg = bg, cex = cex)
	abline(stats::lm(y~x), col = col.smooth, ...)
}



# Matriz de graficos XY con smoothers
pairs(dat.ct, upper.panel = panel.cor, 
			  diag.panel = panel.hist,
			  lower.panel = panel.smooth)

# Matriz de graficos XY con lineas rectas
pairs(dat.ct, upper.panel = panel.cor,
			  diag.panel = panel.hist,
			  lower.panel = panel.lm)

# Puedes cambiar el tamaño de los puntos para que sean más chicos		  
pairs(dat.ct, upper.panel = panel.cor,
			  diag.panel = panel.hist,
			  lower.panel = panel.lm,
			  pch=".")


