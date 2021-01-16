# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #  
# # # # GRAFICAS DE PUNTOS XY
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Datos son medidas de largo del manto y di�metro del ojo de embriones de pulpos O. vulgaris y O. maya, que fueron
# sometidos a dos tratamientos t�rmicos: un control constante a 24oC, y una rampa que fue subiendo desde 24 a 30oC a
# lo largo de 17-31 y 15 a 45 dias de desarrollo, para cada especie, respectivamente.
# Describir los cambios en el tama�o relativo del ojo con respecto al manto dependiendo de la exposici�n t�rmica. 
# Preguntas: �c�mo cambia el diametro del ojo con respecto al manto en embriones de O. vulgaris?
# 			 �el incremento t�rmico afecta el crecimiento relativo del ojo con respecto al manto en O. vulgaris?
# 			 �a partir de qu� temperatura se observan alteraciones en el crecimiento relativo de ojo y manto?
# Datos: ceja 'morfocto' en exel 'datosViz.xlsx' 


dat<-read.delim(file.choose(), head=T)
str(dat)

# I. Para visualizar todos los datos de diametro de ojo en funcion del largo del manto:
ggplot(dat[dat$spec=="vulgaris",], aes(x=LargM, y=DiamO))+
	   geom_point()

# Para cambiar el tama�o (default es 2) y forma (default 19) de los puntos	   
ggplot(dat[dat$spec=="vulgaris",], aes(x=LargM, y=DiamO))+
	   geom_point(size=2, shape=21)

	   
# II. Para visualizar los datos agrupados por una variable categ�rica.
# Para visulizar los datos por tratamiento, esta se mapea con el aesthetics "colour"
ggplot(dat[dat$spec=="vulgaris",], aes(x=LargM, y=DiamO, colour=treat))+
	   geom_point(size=2, shape=19)+
	   scale_colour_brewer(palette="Dark2")
	   
ggplot(dat[dat$spec=="vulgaris",], aes(x=LargM, y=DiamO, shape=treat))+
	   geom_point(size=2)+
	   scale_shape_manual(values=c(19,4))  
	   
	   
# III. Para visualizar los datos agrupados por una variable continua 	   
# La temperatura es continua y va de 24 a 30. Si esta se mapea con el aesthetics "fill", entonces s�lo podr�n usarse 
# formas rellenables (de la 21 en adelante). Nota: asegurate de usar la funci�n scale_fill_gradient.	   
ggplot(dat[dat$spec=="vulgaris",], aes(x=LargM, y=DiamO, fill=temp))+
	   geom_point(size=2, shape=21)+
	   scale_fill_gradient(low="blue", high="red", limits=c(24,30))	   
	   
# Aternativamente, se mapea la variable continua como "colour", y se usan las formas s�lidas (1-19). Nota: ahora usa
# la funci�n scale_colour_gradient.   
ggplot(dat[dat$spec=="vulgaris",], aes(x=LargM, y=DiamO, colour=temp))+
	   geom_point(size=2, shape=19)+
	   scale_colour_gradient(low="blue", high="red", limits=c(24,30))	   
	   
# Tambi�n puedes mapear la variable continua como "size" para que cambien de tama�o los puntos de acuerdo con dicha
# variable. Para eso debes saber que por default los puntos van de 1-6 mm ancho.
ggplot(dat[dat$spec=="vulgaris",], aes(x=LargM, y=DiamO, colour=temp, size=temp))+
	   geom_point()+
	   scale_colour_gradient(low="blue", high="red", limits=c(24,30))
	   
	   	   