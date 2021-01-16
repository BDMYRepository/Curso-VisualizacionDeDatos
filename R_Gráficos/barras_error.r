# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #  
# # # # USO DE BARRAS DE ERROR
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Haremos una subselección de los datos de morfometría en pulpos con únicamente aquellos obtenidos durante el tratamiento
# de rampa para ambas especies.
# Datos: ceja 'morfocto' en exel 'datosViz.xlsx'  

dat<-read.delim(file.choose(), head=T)
str(dat)

dat.r<-dat[dat$treat=="rampa",]

# Preparamos un data.frame con los valores de las medias de DiamO por temperatura y especie (dos-vias de clasificación)
dos_vias<-aggregate(dat.r$DiamO, by=list(dat.r$temp, dat.r$spec), mean)
dos_vias$desv<-aggregate(dat.r$DiamO, by=list(dat.r$temp, dat.r$spec), sd)$x
names(dos_vias)<-c("temp", "spec", "media", "desv")

# Preparamos un segundo data.frame con los valores de unicamente O. maya:
una_via<-dos_vias %>%
		filter(spec=="maya")	

		
# I. Para colocar las barras de error en un gráfico de barras con solo una variables categórica se usa la funcion
# 'geo_col'. Nota: el argumento width se refiere al ancho de la tapa de la barra de error.	
ggplot(una_via, aes(x=temp, y=media))+
	   geom_col(fill="red", colour="black", alpha=0.6)+
	   geom_errorbar(aes(ymin=media- desv, ymax=media + desv), width = 0.2)
	   
ggplot(una_via, aes(x=temp, y=media))+
	   geom_col(fill="red", colour="black", alpha=0.6)+
	   geom_errorbar(aes(ymin=media- desv, ymax=media + desv), width = 0.8)
	   

# Para colocar las barras de error en un gráfico de lineas con solo una variable categórica se usa la función
# 'geom_line' y 'geom_point'. Es posibe cambiar los aesthethics de la linea y de los puntos.
ggplot(una_via, aes(x=temp, y=media))+
	   geom_line(linetype=2, size=0.5)+
	   geom_point(size=2)+
	   geom_errorbar(aes(ymin=media- desv, ymax=media + desv), width = 0.2)

	   
# II. Para colocar las barras de error en gráficos de barras con dos variables categóricas se mapea la segunda
# variable categorica con el argumento 'fill'. El argumento 'dodge' es para mover la barra de error al centro
# de cada barra
ggplot(dos_vias, aes(x=temp, y=media, fill=spec))+
	   geom_col(position="dodge")+
	   geom_errorbar(aes(ymin=media- desv, ymax=media + desv), 
	   				position=position_dodge(0.9), width=0.2)
	   					   
ggplot(dos_vias, aes(x=temp, y=media, fill=spec))+
	   geom_col(position="dodge")+
	   geom_errorbar(aes(ymin=media- desv, ymax=media + desv), width=0.2)

	   
# Para colocar barras de error en gráficos de lineas con dos variables categóricas se colocan primero las barras
# de error para que aparezcan por debajo de las lineas y puntos. Además se debe usar el argumento dodge en todos
# los elementos de la gráfica para que se vena alineados.	   				
ggplot(dos_vias, aes(x=temp, y=media, colour=spec, group=spec))+
	   geom_errorbar(aes(ymin=media- desv, ymax=media + desv), 
	   				 width=0.2,
	   				 size=0.25,
	   				 colour="black",
	   				 position=position_dodge(0.3)
	   				 )+
	   geom_line(linetype=2, size=1, position=position_dodge(0.3))+
	   geom_point(size=2, position=position_dodge(0.3))
	   				
	  