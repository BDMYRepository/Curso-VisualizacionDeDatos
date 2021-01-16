# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #  
# # # # HEATMAPS
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Datos son conteos totales de cinco comportamientos de cortejo observados en parejas de caballitos de mar a lo
# largo de cinco días. 
# Representar valores del número de comportamientos a lo largo del tiempo. 
# Preguntas: ¿aumenta el número de comportamientos con los días? ¿hay algún día con más comportamientos que otro?
# 			 ¿existe alguna asociación en la frecuencia de ciertos comportamientos en ciertos días?
# 			 ¿el cambio en a lo largo de los días es similar en todos los comportamientos?
# Datos: ceja 'cortejo1' en exel 'datosViz.xlsx' 

dat<-read.csv(file.choose(), head=T)
str(dat)

# Las variables categóricas estan representadas en los ejes x y y, el valor de la variable continua se mapea con
# "fill". Se puede usar geom_raster o geom_tile: 
ggplot(dat, aes(x=dia, y=compor, fill=total))+
	   geom_raster()

ggplot(dat, aes(x=dia, y=compor, fill=total))+
	   geom_tile()	   	   

	   
# Para conseguir una mejor separación de los colores en un gradiente se puede cambiar la paleta de colores, pero
# esta debe ser aplicable a una variable continua (no a variables categóricas o grupos).
ggplot(dat, aes(x=dia, y=compor, fill=total))+
	   geom_raster()+
	   scale_fill_gradient2(midpoint=200, mid="grey70", limits=c(0,1000))

# Al escoger gradient2 para el gradiente de color, podemos asignar un valor medio y de ahí a los límites inferior
# y superior de rango de valores que toma la variable continuar. Aquí escogimos la mediana como midpoint.
summary(dat$total)	   

# También se puede escoger gradient (no tiene un midpoint) que solo requiere definir los colores en los extremos del
# gradiente y los límites numericos de los mismos.	   
ggplot(dat, aes(x=dia, y=compor, fill=total))+
	   geom_raster()+
	   scale_fill_gradient(low="lightblue", high="purple", limits=c(0,1000))

