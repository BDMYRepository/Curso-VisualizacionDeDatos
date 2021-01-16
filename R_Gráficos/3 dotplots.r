# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #  
# # # # GRAFICOS DE PUNTOS (CLEVELAND)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Datos son promedio de calificaciones por grupo en dos asignaturas de estadística (ProbEst y PlanExp) a lo largo de
# distintos semestres desde 2008 hasta 2020 impartidos en un programa de licenciatura. Los datos también se agrupan
# de acuerdo con la estrategia didáctica seguida en el aula (Tradicional, Programación computacional).
# Representar valores de calificaciones en semestres y cursos. 
# Preguntas: ¿cuál es el rango de calificaciones en general? ¿cual es el rango de calificaciotienen por semestre
# 			  por asignatura? ¿hubo semestres y/o cursos con calificaciones extremas (altas o bajas)?
# 			  ¿cómo se comparan las calificaciones según la estrategia didáctica seguida en el aula?
# Datos: ceja 'notasesta' en exel 'datosViz.xlsx' 

dat<-read.csv(file.choose(), head=T)
str(dat)

# I. Los datos presentan típicamente una sola variable continua y sus entradas (observaciones) pueden o no ordenarse
# de acuerdo a dicha variable continua.
# Para hacer una gráfica de puntos tipo Cleveland se usa geom_point:
ggplot(dat, aes(x=prom, y=semes))+
	   geom_point()

# Para ordenar los puntos de acuerdo a los valores de la variable continua, y cambiar su tamaño: 	   	   
ggplot(dat, aes(x=prom, y=reorder(semes, prom)))+
	   geom_point(size=3)
	   
# Para intercambiar los ejes del gráfico, eliminar la cuadrícula del fondo, e inclinar las leyendas del eje x:
ggplot(dat, aes(x=reorder(semes, prom), y=prom))+
	   geom_point(size=3)+
	   theme_bw()+
	   theme(panel.grid.major.y = element_blank(),
	   		 panel.grid.minor.y = element_blank(),
	   		 panel.grid.major.x = element_line(colour="grey60", linetype="dashed"),
	   		 axis.text.x= element_text(angle=60, hjust=1)
	   		 )
	   		 

# II. Los valores de la variable se pueden agrupar con base en una segunda variable categórica:	   		 
ggplot(dat, aes(x=prom, y=semes))+
		geom_point(size=3, aes(colour=asign))+
		scale_colour_brewer(palette="Set1")
		
# Para ordenar los puntos de acuerdo a los valores de la variable continua:
ggplot(dat, aes(x=prom, y=reorder(semes, prom)))+
		geom_point(size=3, aes(colour=asign))+
		scale_colour_brewer(palette="Set1")+
		geom_segment(aes(yend=semes),xend=0, colour="grey50")+
		theme_bw()+
	    theme(panel.grid.major.y = element_blank(),
	    	  legend.position = c(0.8,0.3)
	    	  )
		
# Para separar los puntos ordenados en grupos de la segunda variable categórica se pueden usar facetas:
ggplot(dat, aes(x=prom, y=reorder(semes, prom)))+
		geom_point(size=3, aes(colour=asign))+
		geom_segment(aes(yend=semes),xend=0, colour="grey50")+
		facet_grid(asign~., scales="free_y", space="free_y")+
		theme(legend.position="none") 
		 
		
# III. Otros recursos de aesthetics para agrupar los valores con base en una tercera variable categórica:
ggplot(dat, aes(x=prom, y=reorder(semes, prom)))+
		geom_point(size=3, aes(shape=didac, colour=didac))+
		geom_segment(aes(yend=semes),xend=0, colour="grey50")+
		facet_grid(asign~., scales="free_y", space="free_y")+
		theme_bw()+
	    theme(panel.grid.major.y = element_blank(),
	    	  legend.position = c(0.9,0.2),
	    	  legend.justification= c(1, 0.5)
	    	  )   			

