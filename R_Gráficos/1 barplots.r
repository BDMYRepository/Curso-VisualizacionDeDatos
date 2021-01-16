# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #  
# # # # GRAFICOS DE BARRAS
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Datos son número de caballitos registrados en video transectos realizados en una laguna costera de la PY.
# Representar distribución de caballitos en el espacio de la laguna muestreada. 
# Preguntas: ¿cuál es el número de caballitos más frecuente? ¿tienen dsitribuciones agregadas o son solitarios?
# 		     ¿es común encontrar caballitos en esa laguna o es un evento raro? 
# Datos: ceja 'caba1' en exel 'datosViz.xlsx' 

dat<-read.delim(file.choose(), head=T)
str(dat)

# I. Para contar los resultados de encontrar desde 0 hasta xi caballitos por video-transecto y hacer un barplot.
# Nota: no hubo ningun video-trans con 5 caballitos.
ggplot(dat, aes(x=result))+
	   geom_bar()
	   
# Si usas la xi como factor y haces un barplot, aquellos valores de xi para los cuales y valga cero no aparecerán.
ggplot(dat, aes(x=factor(result)))+
	   geom_bar()

# Para cambiar el color:	   
ggplot(dat, aes(x=factor(result)))+
	   geom_bar(fill = "plum3", color = "black")

# Para poner las barras horizontales
ggplot(dat, aes(x=factor(result)))+
	   geom_bar(fill = "plum3", color = "black")+
	   coord_flip()
	   	   
# Para agregar textos a las barras.
ggplot(dat, aes(x=factor(result)))+
	   geom_bar(fill = "plum3", color = "black")+
	   geom_text(aes(label=..count..), stat="count", vjust=1.5, colour="black")	
	   
ggplot(dat, aes(x=factor(result)))+
	   geom_bar(fill = "plum3", color = "black")+
	   geom_text(aes(label=..count..), stat="count", vjust=-0.3, colour="black")	   


# Para hacer barplot sobre datos de una tabla de frecuencias ya existente. Nota: la variable en el eje x es
# tomado como factor por lo tanto el resultado de 5 caballitos en un video-tran no aparece.
tab1<-data.frame(table(dat$result))
names(tab1)<-c("cab", "vidtran")
str(tab1)
ggplot(tab1, aes(x=cab, y=vidtran))+
	   geom_col(fill = "plum3", color = "black")	   
	   
  

