# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #  
# # # # GRAFICOS PARA DATOS BINARIOS Y PROBABILIDAD
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Los datos provienen del famoso estudio del Dr. Herman Bumpus (1899) sobre la morfometría del gorrión
# Passer domesicus, en los que analizó 9 medidas corporales de una muestra de gorriones (hembras y
# machos) que fueron encontrados helándose en Providence (USA) durante un invierno particularmente
# mordaz. Las medidas que Bumpus registró fueron:  Alar Extent (AE mm), Length of Humerus (BHL in), 
# Length of Femur (FL in ), Total Length (TTL mm), Width of Skull (SW in), Length of Keel of Sternum (SKL in)
# Explorar las diferencias morfométricas entre los sexos. 
# Datos: ceja 'bumpus' en exel 'datosViz.xlsx' 

dat<-read.delim(file.choose(), head=T)
str(dat)

# I. Preparacion de los datos.
# Dadas las diferencias en escala y unidades de medición, los datos deben ser normalizados previo al análisis.
# Para ello, usaremos la función 'decostand' de la librería 'vegan'. 
library(vegan)
dat.n<-decostand(dat, "standardize")

# Después es necesario obtener las medias multivariadas de cada grupo (sexo) con la funcion 'agrregate'.
mediasmult<-aggregate(dat.n, list(sex = dat$sex), mean)

# Para hacer gráficos radiales o de araña usaremos la función radachart de la libreria 'fmsb'. Esta función
# aplicada sobre un data.frame obtiene el valor máximo y el mínimo de la tabla, respectivamente. Nota: la
# columna 1 de la tabla es el "sexo".
library(fmsb) 

# Obtener el valor maximo de la tabla, y genera una fila con ncol numero de columnas
MX <- c(NA, rep(max(mediasmult[,-1]), ncol(mediasmult)-1))
# Obtener el valor minimo de la tabla, y genera de una fila con ncol numero de columnas
MN <- c(NA, rep(min(mediasmult[,-1]), ncol(mediasmult)-1))
# Adhiere las dos filas anteriores en el orden correcto a la tabla de medias multivariadas
mediasmult.v <- rbind(MX, MN, mediasmult) 

# II. Para obtener un único gráfico de araña con líneas:
par(mfrow = c(1, 1), mar=c(2,2,1,1)) 
radarchart(mediasmult.v [,-1],axistype=4, # forma de colocar los ejes de la tela de araña
			seg=4, 						# numero de segmentos de la tela de araña
			cglty=2,cglwd=1.5,cglcol=1,	# tipo, ancho y color de la tela de araña
			pty=1,						# tipo simbolo en las lineas de las entradas graficadas
			plty=1,						# tipo de lineas de las entradas graficadas
			pcol=c("red","blue"),		# color de las líneas de cada entrada graficada
			plwd=2,						# ancho de las lineas de las entradas graficadas
			axislabcol=1)				# color de las lyendas de los ejes de la tela de araña
legend(1, 1.2, legend = levels(as.factor(mediasmult.v$sex)), title = "Sexo", col = c("red","blue"),
		seg.len = 2, border = "transparent", pch = 16, lty = 1)
										# leyenda (los numeros iniciales son las coordenadas).

										
# Para obtener un único gráfico de araña con polígonos achiurados:										
radarchart(mediasmult.v [,-1],axistype=4, # forma de colocar los ejes de la tela de araña
			seg=4, 						# numero de segmentos de la tela de araña
			cglty=2,cglwd=1.5,cglcol=1,	# tipo, ancho y color de la tela de araña
			pty=1,						# tipo simbolo en las lineas de las entradas graficadas
			plty=1,						# tipo de lineas de las entradas graficadas
			pcol=c("red","blue"),		# color de las líneas de cada entrada graficada
			plwd=2,						# ancho de las lineas de las entradas graficadas
			axislabcol=1,				# color de las lyendas de los ejes de la tela de araña
			pdensity = 20, pangle = 30, pfcol = c("red","blue"))										

			
# II. Para colocar una linea de cada grupo en gráficos de araña por separado
COL<-colorRampPalette(c("red", "blue"))(nrow(mediasmult.v)-2) # para usar colores distintos en cada iteración
		
par(mfrow = c(1, 2),mar=c(2,2,1,1)) 
for(i in 3:nrow(mediasmult.v)){  			# solo a partir de la fila 3 (porque la 1 y 2 tienen los max y min).
radarchart(mediasmult.v[c(1,2,i), -1],	# producir el primer grafico para i=3 fila tercera 
			seg =4,						# numero de segmentos de la tela de araña
			pcol=COL[i-2], 				# colores para las lineas de cada grafico, usando i para cada iteración
			cglcol=1, 					# color de la tela de araña
			title = paste("Sexo:", mediasmult.v$sex[i], sep=" ")) # titulos de cada grafico
}


# Para rellenar los polígonos
par(mfrow=c(2, 1)) 
for(i in 3:nrow(mediasmult.v)){ 
radarchart(mediasmult.v[c(1, 2, i), -1], pcol=COL[i-2], plty=1, cglcol=1, seg=4,
			pdensity = 50, pangle = 30, pfcol = COL[i-2]) # comandos para el achiurado de las areas poligonales
}




