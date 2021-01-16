# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #  
# # # # HISTOGRAMAS DE FRECUENCIAS
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Datos son medidas de largo patrón de Abudefduf troschelli en pozas de intermarea en dos localidades rocosas 
# durante muestreos en la costa de Baja California Sur. 
# Objetivo:	Representar la distribución del torso de los peces
# Preguntas: ¿cuáles son las medidas de tendencia central y de dispersión de los datos en cada localidad?
# 			 ¿cuál es la forma de la distribcuión de los datos? ¿como difieren las distribuciones de los 
# 			 datos entre localidades?
# Datos: ceja 'lpatr' en exel 'datosViz.xlsx' 

dat<-read.csv(file.choose(), head=T)
str(dat)

# I. Para hacer un histrograma a partir de un juego de datos:
# Es posible indicar el nombre del data.frame en el primer argumento, y referir las columnas para mapear los valores
# de las variables x y y; o bien, declarar NULL el primer argumento y referir las columnas con "$nombrecolumna"
ggplot(dat, aes(loc2)) + geom_histogram()
ggplot(NULL, aes(x=dat$loc2)) + geom_histogram()


# Para cambiar el número de intervalos o 'bins'. Si se sigue la regla de Sturges. Para calcular el número de
# intervalos, y luego el tamaño ("binwidth") de cada intervalo aplica
No.intervalos<-round(1 + log(length(dat$loc2), base=2), 0) 
tama<-(max(dat$loc2)-min(dat$loc2))/No.intervalos

ggplot(dat, aes(loc2)) +
	   geom_histogram(binwidth=tama, fill="white", colour="black", boundary=10)

# El argumento 'boundary' establece el valor de x donde comienza el primer intervalo, y modificarlo cambia el
# aspecto del histograma.
ggplot(dat, aes(loc2)) +
	   geom_histogram(binwidth=tama, fill="white", colour="black", boundary=5)

	   
# Para visualizar el área bajo la curva de un histograma se puede adicionar la densidad de probabilidad. La funcion
# 'expand_limits' extiende los valores calculados hasta valores donde y =0:	   
ggplot(dat, aes(x=loc2)) + geom_line(stat="density")
	   
ggplot(dat, aes(x=loc2)) + geom_line(stat="density") +
	   expand_limits(y=0)

# Puedes ajustar la suavidad para dibujar la linea:
ggplot(dat, aes(x=loc2)) +	   
	   geom_line(stat="density", adjust=.25, colour="red") +
	   geom_line(stat="density") +
	   geom_line(stat="density", adjust=2, colour="blue")

# Puedes colocar la linea de densidad sobre las barras del histograma y hacerlo transparente:	   	   
ggplot(dat, aes(x=loc2, y=..density..)) +
	   geom_histogram(binwidth=tama, fill="cornsilk", colour="grey60", size=.2) +
	   geom_density()	   
	   
	   
# II. Para hacer dos histrogramas o histogramas condicionales con dos juegos de datos:
# Primero debes generar una tabla con los datos de largo patron en una sola columna y otra con el identificador de 
# la localidad de cada juego de datos. Para eso requiere estibar (stack) los datos, guardarlos como data.frame y 
# darles encabezados adecuados. El siguiente código hace esto:
tab1<-stack(dat)
names(tab1)<-c("lpatr", "loc")

# Para hacer dos histogramas uno arriba de otro con el eje x alineado:		
ggplot(tab1, aes(x=lpatr)) + geom_histogram(binwidth=tama, fill="white", colour="black") +
	   facet_grid(loc ~ .)	

# Para hacer los dos histogramas uno encima del otro, y con rellenos de color distinto pero transparentes:
ggplot(tab1, aes(x=lpatr, fill=loc)) +
	   geom_histogram(binwidth=tama, position="identity", alpha=0.6)

# Puedes colocar el area bajo la curva de dos histogramas que deseas comparar:	   
ggplot(tab1, aes(x=lpatr, fill=loc)) + geom_density(alpha=.6)


# III. Para hacer un polígono de frecuencias, se usa 'geom_freqpoly' y también se puede ajustar 'binwidth':
ggplot(dat, aes(x=loc2)) +	 
	   geom_freqpoly()

ggplot(dat, aes(x=loc2)) +	 
	   geom_freqpoly(binwidth=tama)
	   	   
ggplot(dat, aes(x=loc2)) +	 
	   geom_freqpoly(binwidth=10)


###calculo frec

tab2<-data.frame(table(dat$loc2))

expot.csv(as.data.frame(table(loc2=factor(cut(loc2, breaks=9, dig.lab = 1)))))


	   