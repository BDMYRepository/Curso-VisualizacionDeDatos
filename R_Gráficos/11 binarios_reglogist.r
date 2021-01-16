# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #  
# # # # GRAFICOS PARA DATOS BINARIOS Y PROBABILIDAD
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Datos son presencia o ausencia de ingestión de mejillones por cangrejos Carcinus meanas de distinto cefalotorax. 
# Los mejillones eran de tres tallas distintas (chicos, medianos o grandes). 
# Comparar la probabilidad de un mejillon de ser ingerido por cangrejos de distinto tamaño, dependiendo del tamaño
# de la concha. 
# Preguntas: ¿cómo cambia la probabilidad de un mejillón de ser ingerido dependiendo del tamaño del depredador?
# 			 ¿cómo cambia la relación entre la probabilida de ser ingerido y el tamaño del depredadro cuando se
# 			 trata de mejillones grandes, medianos o chicos? 
# Datos: ceja 'inges' en exel 'datosViz.xlsx' 

dat<-read.delim(file.choose(), head=T)
str(dat)

# I. Para hacer un gráfico de puntos XY con unicamente los datos sobre mejillones grandes (trat==AGDE)
ggplot(dat[dat$trat=="AGde",], aes(x=cefal, y=PA))+
	   geom_point()
	   
# Para ver la dispersión de los resultados de presencia/ausencia de ingestión
ggplot(dat[dat$trat=="AGde",], aes(x=cefal, y=PA))+
	   geom_point(position=position_jitter(width=0.1, height=0.03), size=1.5)+
	   stat_smooth(method=glm, method.args=list(family="binomial"))
	   	   
# Para ajustar una regresión logística usando la funcion 'stat_smooth' sobre los datos de PA de ingestión
ggplot(dat[dat$trat=="AGde",], aes(x=cefal, y=PA))+
	   geom_point(position=position_jitter(width=0.1, height=0.03), size=1.5)+
	   stat_smooth(method=glm, method.args=list(family="binomial"))
	   
# II. Para hacer un gráfico con datos agrupados según otra variable categorica (en este caso tratamiento)
ggplot(dat, aes(x=cefal, y=PA, shape=trat))+
	   geom_point(position=position_jitter(width=0.1, height=0.03), size=1.5)+
	   scale_shape_manual(values= c(21, 4, 17))
   
# Para usar colores para distinguir a los tratamientos y ajustar regresiones logísticas por grupo    
ggplot(dat, aes(x=cefal, y=PA, colour=trat))+
	   geom_point(position=position_jitter(width=0.1, height=0.03), size=1.5)+
	   scale_colour_manual(values= c("purple", "orange", "green"))+
	   stat_smooth(method=glm, method.args=list(family="binomial"))
	   
	   
# III. Para ajustar lineas a partir de coeficientes estimados previamente en un modelo lineal generalizado (GLM).	   
mod2<-glm(PA~cefal * trat, data=dat, family=binomial(link=logit))
coef(mod2)

# Para generar los valores predichos por el modelo (i.e. lineas) se usa la función predict sobre datos de x. Como se
# trata de un GLM, en este caso es muy importante definir el tipo de predicción como "response"

D1=data.frame(cefal=dat$cefal,trat="AGde")
D1$P1=predict(mod2,newdata=D1, type="response")

D2=data.frame(cefal=dat$cefal,trat="BMed")
D2$P2=predict(mod2,newdata=D2, type="response")

D3=data.frame(cefal=dat$cefal,trat="CChi")
D3$P3=predict(mod2,newdata=D3, type="response")

ggplot(dat, aes(x=cefal, y=PA, colour=trat))+
	   geom_point(position=position_jitter(width=0.1, height=0.03), size=1.5)+
	   scale_colour_manual(values= c("purple", "orange", "green"))+
       theme_bw() +
       geom_line(data=D1, aes(x=cefal, y=P1), size=1, col="purple")+
       geom_line(data=D2, aes(x=cefal, y=P2), size=1, col="orange")+
       geom_line(data=D3, aes(x=cefal, y=P3), size=1, col="green")+
       labs(y="Probabilidad de ser ingerido", x="Cefalotorax (mm)")

