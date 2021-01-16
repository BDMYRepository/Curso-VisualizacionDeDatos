# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #  
# # # # Diagramas de cajas y violin
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Datos son medidas del ancho de la apertura de la concha de Melongena bispinosa provenientes de diferentes madres,
# que a su vez provienen de diferentes sitios. 
# Objetivo:	Comparar fuentes de variaci�n morfom�trica en torno a la apertura de la concha.
# Preguntas: �c�mo son las distribuciones de frecuencia del ancho de pertura de la concha (i.e. simetricas,
#            unimodales, continuas)? �puedes identificar datos extremos?
# 			 �c�mo difieren los par�mteros de tendencia central y dispersi�n de la variable entre madres?
# 			 �c�mo difieren los par�mteros de tendencia central y dispersi�n de la variable entre sitios? 
# Datos: ceja 'melong' en exel 'datosViz.xlsx' 

dat<-read.csv(file.choose(), head=T)
str(dat)


# I. Para hacr un diagrama de cajas, la variable x debe ser tratada como un factor categ�rico:		
ggplot(dat, aes(x=pobl, y=apert)) + 
		geom_boxplot(width=0.5, outlier.size=1.5, outlier.shape=21, fill = "#FFDB6D", color = "#C4961A")
		
ggplot(dat, aes(x=factor(hembra), y=apert)) + 
		geom_boxplot(width=0.5, outlier.size=1.5, outlier.shape=21, fill = "turquoise", color = "black", alpha=0.5)
		
		
# Para agregar cu�as a la caja:
ggplot(dat, aes(x=pobl, y=apert)) + 
		geom_boxplot(width=0.5, outlier.size=1.5, outlier.shape=21, notch=TRUE)

				
# Para agregar valores de la media a cada caja:
ggplot(dat, aes(x=pobl, y=apert)) + 
		geom_boxplot() +
	    stat_summary(fun.y="mean", geom="point", shape=23, size=3, fill="red")


# Para cambiar el orden de la variable x categ�rica, o seleccionar un subset de dicha variable:
ggplot(dat, aes(x=pobl, y=apert)) + 
		geom_boxplot(fill= "orange", alpha= .2) +
		scale_x_discrete(limits=c("CT","C"))	
		
ggplot(dat, aes(x=pobl, y=apert)) + 
		geom_boxplot(fill= "orange", alpha=0.5) +
		scale_x_discrete(limits=c("CT"))	    
	    	    	    

# Para poner las cajas horizontales con los niveles revertidos:
ggplot(dat, aes(x=pobl, y=apert)) + 
		geom_boxplot(fill= "orange", alpha=0.5) +
		coord_flip()+
		scale_x_discrete(limits=rev(levels(dat$pobl)))	
		

# II. Para hacer una gr�fico de viol�n:
ggplot(dat, aes(x=factor(hembra), y=apert)) + 
	    geom_violin(width=1, fill="gray", outlier.colour=NA) +
	    stat_summary(fun.y=median, geom="point", fill="red", shape=21, size=2.5)
	    
	    	    
# Para ajustar el nivel de suavizaci�n de los contornos del viol�n:
ggplot(dat, aes(x=pobl, y=apert)) + 
	    geom_violin(adjust=0.5)
	    
ggplot(dat, aes(x=pobl, y=apert)) + 
	    geom_violin(adjust=3)  


# Para mostrar diferencias en el n�mero de elementos de las muestras (cuando las hubiera), el argumento 'scale'
# permite hacer las areas de los violines proporcionales al n�mero de elementos:
ggplot(dat, aes(x=pobl, y=apert)) + 
	    geom_violin(adjust=2) 

ggplot(dat, aes(x=pobl, y=apert)) + 
	    geom_violin(adjust=2, scale="count")+geom_boxplot() 
	    