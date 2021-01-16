# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #  
# # # # GRAFICOS DE BARRAS CONDICIONALES
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Datos son número de caballitos registrados en video transectos realizados en una laguna costera de la PY en dos
# épocas distintas.
# Comparar la distribución de caballitos entre épocas en la laguna muestreada. 
# Preguntas: ¿cambia el número de caballitos más frecuente de una época a otra? ¿cambia el comportamiento
# 			 ¿gregario de una época a otra? ¿como se comparan las épcoas si cada una tuvo diferente número
# 			 de video-transectos?
# Datos: ceja 'caba2' en exel 'datosViz.xlsx' 

dat<-read.delim(file.choose(), head=T)
str(dat)
dat.s<-data.frame(epoca=stack(dat)$ind, result=stack(dat)$values)
str(dat.s)

# Mapea época con el argumento fill desde los aesthetics primarios. Nota: cuando una barra tiene frecuencia cero,
# la otra toma todo el espacio.
ggplot(dat.s, aes(x=result, fill=epoca))+
	   geom_bar(colour="black")
  
# I. Ancho de barras
# Para poner las barras unas junto a otras:	   
ggplot(dat.s, aes(x=result, fill=epoca))+
	   geom_bar(position="dodge", colour="black")

	   	   
#Para ajustar el ancho de las barras y el espacio entre ellas:
ggplot(dat.s, aes(x=result, fill=epoca))+
	   geom_bar(position="dodge", colour="black", width=0.5)
	   

# El argumento width establece el ancho de las barras sobre el valor xi del eje de las x, siendo width=1
# el máximo posible para que no se traslapen. Al diminuir width se aumento el espacio entre valores
# de xi en el eje x:
ggplot(dat.s, aes(x=result, fill=epoca))+
	   geom_bar(position="dodge", colour="black", width=0.3)
	   
ggplot(dat.s, aes(x=result, fill=epoca))+
	   geom_bar(position="dodge", colour="black", width=1)
	   
ggplot(dat.s, aes(x=result, fill=epoca))+
	   geom_bar(position="dodge", colour="black", width=1.3)
	   

# Para colocar la posición del valor de xi entre barras de distintas epocas usa el argumento 'position=position_dodge()'	   
ggplot(dat.s, aes(x=result, fill=epoca))+
	   geom_bar(colour="black", width=0.9, position=position_dodge())

	   Si le das valor al argumento con width, puedes modificar la separación de barras de distinta época:	   
ggplot(dat.s, aes(x=result, fill=epoca))+
	   geom_bar(colour="black", width=0.9, position=position_dodge(width=0.1))
	   
ggplot(dat.s, aes(x=result, fill=epoca))+
	   geom_bar(colour="black", width=0.9, position=position_dodge(width=0.5))
	   
ggplot(dat.s, aes(x=result, fill=epoca))+
	   geom_bar(colour="black", width=0.9, position=position_dodge(width=0.9))

	   	   
# Si cambias a la vez el ancho de las barras, y el ancho de la posición de la separación:
ggplot(dat.s, aes(x=result, fill=epoca))+
	   geom_bar(colour="black", width=0.2, position=position_dodge(width=0.9))
	   
ggplot(dat.s, aes(x=result, fill=epoca))+
	   geom_bar(colour="black", width=0.8, position=position_dodge(width=0.5))
	   

# II. Color
# Para cambiar el color usando paletas definidas en R:	   
ggplot(dat.s, aes(x=result, fill=epoca))+
	   geom_bar(colour="black",width=0.9, position=position_dodge(width=0.9))+	   
	   scale_fill_brewer(palette = "Dark2")
	   
	   
# III. Barplots estibados usando geom_col
tab2<-data.frame(table(dat.s))

ggplot(tab2, aes(x=result, y=Freq , fill=epoca))+
	   geom_col(color = "black")


# Para hacer barras estibadas proporcionales	   
ggplot(tab2, aes(x=result, y=Freq , fill=epoca))+
	   geom_col(color = "black", position="fill")
	   
# Con la escala del eje y en porcentaje
ggplot(tab2, aes(x=result, y=Freq , fill=epoca))+
	   geom_col(color = "black", position="fill")+
	   scale_y_continuous(labels= scales::percent)			   
	   
