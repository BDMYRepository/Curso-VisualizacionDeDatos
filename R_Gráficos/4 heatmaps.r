# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #  
# # # # HEATMAPS
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Datos son conteos totales de cinco comportamientos de cortejo observados en parejas de caballitos de mar a lo
# largo de cinco d�as. 
# Representar valores del n�mero de comportamientos a lo largo del tiempo. 
# Preguntas: �aumenta el n�mero de comportamientos con los d�as? �hay alg�n d�a con m�s comportamientos que otro?
# 			 �existe alguna asociaci�n en la frecuencia de ciertos comportamientos en ciertos d�as?
# 			 �el cambio en a lo largo de los d�as es similar en todos los comportamientos?
# Datos: ceja 'cortejo1' en exel 'datosViz.xlsx' 

dat<-read.csv(file.choose(), head=T)
str(dat)

# Las variables categ�ricas estan representadas en los ejes x y y, el valor de la variable continua se mapea con
# "fill". Se puede usar geom_raster o geom_tile: 
ggplot(dat, aes(x=dia, y=compor, fill=total))+
	   geom_raster()

ggplot(dat, aes(x=dia, y=compor, fill=total))+
	   geom_tile()	   	   

	   
# Para conseguir una mejor separaci�n de los colores en un gradiente se puede cambiar la paleta de colores, pero
# esta debe ser aplicable a una variable continua (no a variables categ�ricas o grupos).
ggplot(dat, aes(x=dia, y=compor, fill=total))+
	   geom_raster()+
	   scale_fill_gradient2(midpoint=200, mid="grey70", limits=c(0,1000))

# Al escoger gradient2 para el gradiente de color, podemos asignar un valor medio y de ah� a los l�mites inferior
# y superior de rango de valores que toma la variable continuar. Aqu� escogimos la mediana como midpoint.
summary(dat$total)	   

# Tambi�n se puede escoger gradient (no tiene un midpoint) que solo requiere definir los colores en los extremos del
# gradiente y los l�mites numericos de los mismos.	   
ggplot(dat, aes(x=dia, y=compor, fill=total))+
	   geom_raster()+
	   scale_fill_gradient(low="lightblue", high="purple", limits=c(0,1000))

