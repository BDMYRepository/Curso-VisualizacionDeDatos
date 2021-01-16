# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #  
# # # # DIAGRAMAS DE PASTEL Y WILKINSON DOTPLOTS
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Datos son conteos de Typhlatya mitchelli registradas en video transectos llevados a cabo por 5 diferentes buzos
# en distintos cenotes de la Pen�nsula de Yucat�n. 
# Compara n�mero de video-transectos realizados por los distintos buzos y describir la distribuci�n de resultados
# de los conteos 
# Preguntas: �c�mo se distribuy� el esfuerzo de muetsreo entre los buzos? �c�mo se distribuyeron los resultados
# 			  de los conteos de T. mitchelli? �cu�l fue el resultado m�s frecuente y cu�l el menos?
# Datos: ceja 'typhl' en exel 'datosViz.xlsx' 

dat<-read.delim(file.choose(), head=T)
str(dat)

# Para hacer un diagrama de pie es necesario contar los resultados en cada una de las categor�as del pie. Eso
# se puede hacer con la funci�n 'table' que genera un vector con las frecuencias absolutas 
tab3<-table(dat$obs)
pie(tab3)

# Si los datos se encuentran en el formato de data.frame:
tab4<-data.frame(table(dat$obs))
names(tab4)<-c("obs","freq")
pie(tab4$freq,labels=tab4$obs)

# Para hacer un piechart usando las funciones geom_bar y coord_polar es necesario elaborar una tabla con las
# frecuencias relativas (o proporciones). La funci�n 'mutate' sirve para manipular datos en una tabla.
tab4 <- tab4 %>%
  arrange(desc(obs)) %>%
  mutate(prop = round(freq/sum(freq),2))
tab4

# Para poner los valores de las distintas proporciones sobre cada rebanada del pie es necesario indicar la posici�n
# en y para colocar dichos valores
tab4<-tab4 %>%
  mutate(lab.y.pos=cumsum(prop)- 0.5*prop)
tab4

ggplot(tab4, aes(x = "", y = prop, fill = obs)) +
  geom_bar(width = 1, stat = "identity", color = "white") +
  coord_polar("y", start = 0)+
  geom_text(aes(y=lab.y.pos, label = prop), color = "white")+
  theme_void()

# II. Para hacer Wilkinson dotplots se usa la funci�n 'geom_dotplot'. El eje de la y no tiene ninguna interpretacion
# por lo que debe ser eliminado mediante la funcion 'scale.y.continuous':
ggplot(dat, aes(x=mitch))+
geom_dotplot(binwidth=2)+
scale_y_continuous(breaks=NULL)+
theme(axis.title.y=element_blank())

# Tambi�n se puede definir el n�mero de intervalos de forma manual
ggplot(dat, aes(x=mitch))+
geom_dotplot(binwidth=5)+
scale_y_continuous(breaks=NULL)+
theme(axis.title.y=element_blank())

# Se puede cambiar el tama�o de los dots (entre mayor sea el n�mero mayor el di�metro del dot)
ggplot(dat, aes(x=mitch))+
geom_dotplot(binwidth=2, dotsize=1.5)+
scale_y_continuous(breaks=NULL)+
theme(axis.title.y=element_blank())

# Se puede definir la cercania de un dot al contiguo (entre menor sea el n�mero m�s de traslapan)
ggplot(dat, aes(x=mitch))+
geom_dotplot(binwidth=2, dotsize=0.5, stackratio=1.2)+
scale_y_continuous(breaks=NULL)+
theme(axis.title.y=element_blank())

# Se puede marcar los ticks en el eje de las x (especialmente �til con variables continuas)
ggplot(dat, aes(x=mitch))+
geom_dotplot(binwidth=2, dotsize=0.5, stackratio=1.2)+
geom_rug()+
scale_y_continuous(breaks=NULL)+
theme(axis.title.y=element_blank())

# Se pueden centrar las pilas de dots en el eje de las y: 
ggplot(dat, aes(x=mitch))+
geom_dotplot(binwidth=2, dotsize=0.5, stackratio=1.2, stackdir="center")+
scale_y_continuous(breaks=NULL)+
theme(axis.title.y=element_blank())














