# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #  
# # # # GRAFICAS DE PUNTOS XY (X POR INTERVALOS)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Datos son medidas de peso y largo total de robalos juveniles registradas cada 15 días en un experimento en donde
# los peces fueron cultivados con cinco dietas distintas.
# Describir diferencias en las tasas de crecimiento en el tiempo dependiendo de la dieta. Describir el crecimiento 
# relativo (alometría) de los peces considerando el largo y el peso.  
# Preguntas: ¿cómo cambia el peso de los robalos a lo largo del tiempo? ¿es similar para las diferentes dietas?
# 			 ¿como es el aumento en peso con respecto al aumento en largo? ¿cambia dependiendo de la dieta?
# Datos: ceja 'dietas' en exel 'datosViz.xlsx' 


dat<-read.csv(file.choose(), head=T)
str(dat)

# I. Cuando los datos en el eje x son fijos a intervalos determinados, usa position_jitter para verlos mejor:
ggplot(dat, aes(x=dias, y=Peso, colour=dieta))+
	   geom_point()

ggplot(dat, aes(x=dias, y=Peso, colour=dieta))+
	   geom_point(position=position_jitter(width=3, height=0))

ggplot(dat, aes(x=dias, y=Peso, colour=dieta, shape=dieta))+
	   geom_point(position=position_jitter(width=1.5, height=0))+
	   scale_shape_manual(values=c(1,3,19,8,21)) 

	    	   
# II. Para ajustar una linea que corresponda a un GLM
# Para ajustar un modelo de regresión lineal sobre los datos de la dieta A:
ggplot(dat[dat$dieta=="A",], aes(x=Lt, y=Peso))+
	   geom_point()+
	   stat_smooth(method=lm)
	   
# La función stat_smooth construye un IC al 95% por default. Para cambir el nivel de confianza del intervalo: 
ggplot(dat[dat$dieta=="A",], aes(x=Lt, y=Peso))+
	   geom_point()+
	   stat_smooth(method=lm, level= 0.75)
	   
# Para eliminar el intervalo:   
ggplot(dat[dat$dieta=="A",], aes(x=Lt, y=Peso))+
	   geom_point()+
	   stat_smooth(method=lm, se=FALSE)

# Para cambiar atributos de la linea y de los puntos:
ggplot(dat[dat$dieta=="A",], aes(x=Lt, y=Peso))+
	   geom_point(colour="#A1A1A1")+
	   stat_smooth(method=lm, se=FALSE, colour="black", linetype="dashed", size=1)
	   
	   
# III. Para ajustar lineas que no correspondan a un modelo lineal (GLM)
# Es bastante evidente que la relación peso-long no se ajusta a un modelo lineal. Para ajustar un smoother a los
# datos de la dieta A. Nota: puedes cambiar los atributos de la linea suavizada.
ggplot(dat[dat$dieta=="A",], aes(x=Lt, y=Peso))+
	   geom_point(colour="grey60")+
	   stat_smooth(method=loess, colour="black", size=1)

ggplot(dat[dat$dieta=="A",], aes(x=Lt, y=Peso))+
	   geom_point(colour="grey60")+
	   geom_smooth(method=loess, colour="black", size=1, fullrange=TRUE)


# IV. Para ajustar lineas a partir de coeficientes estimados previamente en un modelo lineal (LM).
# Transformamos Peso para linealizar la relación lnPeso~dias, y ajustamos un modelo con lm sobre los datos completos.
dat$lnPeso<-log(dat$Peso) 
mod1<-lm(lnPeso~dias * dieta, data=dat)
coef(mod1)

# Para generar los valores predichos por el modelo (i.e. lineas) se usa la función predict sobre datos de x. Pero
# antes hay que generar unos nuevos datos en x de acuerdo a cada combinación de variables explicativas en el modelo:

D1=data.frame(dias=dat$dias,dieta="A")
D1$P1=predict(mod1,newdata=D1)

D2=data.frame(dias=dat$dias,dieta="B")
D2$P2=predict(mod1,newdata=D2)

D3=data.frame(dias=dat$dias,dieta="C")
D3$P3=predict(mod1,newdata=D3)

D4=data.frame(dias=dat$dias,dieta="D")
D4$P4=predict(mod1,newdata=D4)

D5=data.frame(dias=dat$dias,dieta="E")
D5$P5=predict(mod1,newdata=D5)

ggplot(dat, aes(x=dias, y=lnPeso))+
	   geom_point(size=1.5, position=position_jitter(width=1.5, height=0))+
       theme_bw() +
       geom_line(data=D1, aes(x=dias, y=P1), size=1, col="purple")+
       geom_line(data=D2, aes(x=dias, y=P2), size=1, col="red")+
       geom_line(data=D3, aes(x=dias, y=P3), size=1, col="orange")+
       geom_line(data=D4, aes(x=dias, y=P4), size=1, col="green")+
       geom_line(data=D5, aes(x=dias, y=P5), size=1, col="blue")

ggplot(dat, aes(x=dias, y=lnPeso, colour=dias))+
  geom_point(position=position_jitter(width=3, height=0))+
  geom_line(data=D1, aes(x=dias, y=P1), size=1, col="purple")+
  geom_line(data=D2, aes(x=dias, y=P2), size=1, col="red")+
  geom_line(data=D3, aes(x=dias, y=P3), size=1, col="orange")+
  geom_line(data=D4, aes(x=dias, y=P4), size=1, col="green")+
  geom_line(data=D5, aes(x=dias, y=P5), size=1, col="blue")


# Para adicionar información relativa al modelo en el plano gráfico (solo para dieta A):
ggplot(dat[dat$dieta=="A",], aes(x=dias, y=lnPeso))+
	   geom_point(size=1.5, position=position_jitter(width=1.5, height=0))+
       theme_bw() +
       geom_line(data=D1, aes(x=dias, y=P1), size=1, col="purple")+
       annotate("text", x=75, y=2.5, label= "m==0.007", parse=TRUE)+
       annotate("text", x=75, y=2.4, label= "Graficaaas", parse=TRUE)



ggplot(dat[dat$dieta=="A",], aes(x=factor(dias), y=lnPeso))+
  geom_boxplot()











 