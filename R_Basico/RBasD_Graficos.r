# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # RBasica D: Gráficos 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# 1. La función 'plot' de la librería basica.

# Existen muchos paquetes distintos para hacer una gran diversidad de gráficos, algunos muy sofisticados tanto en
# formato como en complejidad. La mas usada es la función 'plot' del paquete 'base', que por ser función muy general,
# te devuelve una gráfica distinta dependiendo del objeto sobre el cual sea aplicada. Por ejemplo:

# a) Función 'plot' sobre un vector (por ejemplo, una variable). En el eje Y quedan representados los valores del
# vector, pero en el eje dde las X únicamente coloca las "entradas" o números de la fila correspondiente (nota el
# título del eje "Index").
data(iris)
summary(iris)
plot(iris[,1])

# b) Función 'plot' sobre dos vectores especificados como dos argumentos separados por una coma. Cada punto tiene
# una valor para el eje X y otra para el Y, se trata de un gráfico típico de XY.
plot(iris[,1], iris[,2]) 

# Con la función 'plot' tenemos que especificar lo que va a graficar de alguna de dos maneras: indicando los vectores (x=.., y=) o 
# usando el formato de formula (yy~xx). En el caso de esta última puedes especificar el data.frame en un argumento separado:
plot(x=iris[,1], y=iris[,2])
plot(iris[,2]~iris[,1])
plot(Sepal.Width~Sepal.Length, data=iris)

# c) Función 'plot' sobre una tabla o matriz produce gráficas pareadas de XY para todas las combinaciones de los
# valores de las columnas en dicha tabla. La diagonal corresponde a los gráficos de cada columna contra si misma
# por lo que unicamente aparece el nombre de la columna en cuestión. Los gráficos abajo de la diagonal son imagen
# en el espejo de los de arriba de la diagonal.
plot(iris)

# d) Función 'plot' sobre la función 'table' produce un histograma de frecuencias absolutas que han sido calculadas
# previamente obtenidas con 'table'.
plot(table(iris[,4]))
table(iris[,4])

# Los gráficos obtenidos son muy útiles como gráficos de trabajo ("working plots") ya que con pocos argumentos se
# logran ver tendencias y dispersiones. Sin embargo, hay una serie de argumentos que pueden usarse para mejorar el
# aspecto de la gráfica. Actualmente, la estética de los gráficos en R ha sido desarrollada sobre todo con la 
# librería 'ggplot2' para fines de una publicación. 


# 2. La función 'boxplot' de la librería básica

# Para hacer gráficos de cajas y bigotes se usa la función 'boxplot' que puede ser aplicada sobre un vector, o una
# lista de varios vectores separados por una coma:
boxplot(iris$Sepal.Length)
boxplot(iris$Sepal.Length, iris$Sepal.Width, iris$Petal.Length, iris$Petal.Width)

# También puedes aplicar la función sobre un data-frame (nota que la columna 5 del objeto previo a aplicar la función
# para elaborar el gráfico, pues la columna 5 tiene caracteres de texto.
boxplot(iris[,-5])

# También puedes usar una sintaxis tipo fórmula: Y~X (que se lee Y en función de X):
boxplot(iris[,1]~iris[,5])
boxplot(Sepal.Length~Species, data=iris)

# Para conocer que representan los límites de las cajas y los bigotes puedes consultar la función 'boxplot.stats'
# en la documentación de ayuda de la función.


# 3. La función 'hist', 'barplot' y 'dotchart'.

# La función 'hist' primero obtiene las frecuencias absolutas de un vector numérico y después hace un histograma con
# el resultado. 
hist(iris[,1])

# Es una función con muchos argumentos, de los cuáles 'breaks' especifica el número de veces que se parte el eje de
# las x para producir los intervalos. Este argumento puede ser especificado mediante un vector, indicando los valores
# del eje x donde este se va a partir. Por ejemplo, si quieres sólo 4 intervalos, entonces hay 3 breaks:
hist(iris[,1], breaks=3)

# La función 'barplot' sirve para hacer gráficos de barras cuando especificas el vector a ser graficado y el vector
# de las categorías. Es una función mas general que la de 'hist'. 
barplot(dpois(0:4,0.7),names.arg=c(0,1,2,3,4))

# La función 'dotchart' hace gráficos de puntos para una única variable con el objetivo ver dispersión y datos
# extremos. Puedes hacerla condicional a un factor.
dotchart(iris[,1]) 
dotchart(iris$Petal.Length,groups=factor(iris$Species),col=iris$Species)  
 
# Recomendamos explora los archivos de ayuda de estas funciones gráficas para ver el potencial al cambiar algunos
# de los argumentos.


# 4. Aspectos estéticos generales de gráficos en R

# En términos de lenguaje, la mayoría de las graficas en R tienen la misma estructura y comparten los mismos 
# argumentos. Modificando algunos de estos argumentos puedes mejorar los gráficas y con ello su interpretación.

# a) Color:
# El color puede definirse usando nombres en inglés entre comillas dobles, o números de la paleta:
plot(Sepal.Width~Sepal.Length, data=iris, col="red") 
plot(Sepal.Width~Sepal.Length, data=iris, col=1)
plot(Sepal.Width~Sepal.Length, data=iris, col=Species)

# Pueden definirse distintos colores para borde y relleno:
hist(iris[,1], col="green", border="blue")

# Hay una paleta de colores pre-definidos en R en la librería 'graphics'.
plot(Sepal.Width~Sepal.Length, data=iris, pch=16, col=rainbow(20)) 
?palette

# Para saber los nombres de los colores como están definidos:
colors()
example(colors)
# Un ejemplo on-line:
http://research.stowers-institute.org/efg/R/Color/Chart/index.htm

# b) Símbolos y formas:
# Es posible cambiar los símbolos con el argumento pch ("point character"). A partir del pch=21 se trata de símbolos
# que un color de relleno ('bg') y otro para el borde ('col').
plot(Sepal.Width~Sepal.Length, data=iris, col="red", pch=2)
plot(Sepal.Width~Sepal.Length, data=iris, pch=21, col=1, bg=rainbow(20)) 

# Puedes ponerle un símbolo a cada grupo.
plot(Sepal.Width~Sepal.Length, data=iris)
points(Sepal.Width~Sepal.Length, data=iris[iris$Species=="virginica",], pch=21, col=1, bg="red")
points(Sepal.Width~Sepal.Length, data=iris[iris$Species=="setosa",], pch=22, col=1, bg="cyan")
points(Sepal.Width~Sepal.Length, data=iris[iris$Species=="versicolor",],pch=24, col=1, bg="green")

# Es posible cambiar de tipo de gráfico usando el argmento "typ" para indicar linea ("l"), puntos ("p"), ambos sin
# que cruce la linea por el punto ("b"), y cruzando la linea por el punto ("o").
plot(Sepal.Width~Sepal.Length, data=iris, col="red", pch=2, typ="l")
plot(Sepal.Width~Sepal.Length, data=iris, col="blue", pch=3, typ="b")
plot(Sepal.Width~Sepal.Length, data=iris, col="orange", pch=4, typ="o")

# Es posible cambiar el tipo de línea con 'lty':
plot(Sepal.Width~Sepal.Length, data=iris, col="red", pch=2, typ="l", lty=2)

# c) Tamaño
# Es posible cambiar el tamaño del símbolo con el argumento 'cex' que es un valor de tamaño relativo.
plot(Sepal.Width~Sepal.Length, data=iris, col=1, pch=21, bg=3, typ="p", cex=0.5)
plot(Sepal.Width~Sepal.Length, data=iris, col=1, pch=21, bg=3, typ="p", cex=1.5)

# También puedes hacer que el tamaño sea proporcional al valor de la variable y:
plot(Sepal.Width~Sepal.Length, data=iris, col=1, pch=21, bg=3, typ="p", cex=Sepal.Width)

# d) Atributos de los ejes y leyendas:
# Puedes modificar los límites de los ejes y y x con los argumentos 'xlim' y 'ylim':
plot(Sepal.Width~Sepal.Length, data=iris, pch=21, col=1, bg=rainbow(20)) 
plot(Sepal.Width~Sepal.Length, data=iris, pch=21, col=1, bg=rainbow(20), xlim=c(3,9), ylim=c(0,6))

# Puedes mover el ángulo de los valores en el eje y con el argumento 'las'.
hist(iris[,1], col="blue", las=2)
boxplot(Sepal.Length~Species, data=iris, las=2)

# Puedes poner títulos a las gráficas, añadiendo los argumentos: 
boxplot(Sepal.Length~Species, data=iris, las=1,
	xlab="Lindo", ylab="Fantástico", main="Quiero un café!" )

	
# 5. Gráficos por capas superpuestas

# Otro aspecto muy importante de la función 'plot' (y otras del mismo tipo) es la capacidad de sobreponer
# funciones graficas distintas para adicionar capas al mismo gráfico. Ve añadiendo una a una las líneas de código a
# continuación y revisa qué aspectos se modifican en la gráfica:
plot(Sepal.Width~Sepal.Length, data=iris, cex=.7, pch=3, col=Species) 
lines(Sepal.Width~Sepal.Length, data=iris[iris$Species=="virginica",], col=3, lty=2) 
text(5:8, 4, LETTERS[1:4], col="cadetblue")
abline(v=mean(iris$Sepal.Length), col=4, lwd=1, lty=3)
abline(h=mean(iris$Sepal.Width), col=4, lwd=1, lty=3)
legend("topright", title = "Species", c("I. setosa", "I. versicolor", "I. virginica"), col = c(1,2,3),
       text.col = "orange", lty = c(NA, NA, 2), pch = c(3, 3, 3),
       merge = TRUE, bg = "gray90" )
       
plot(Sepal.Width~Sepal.Length, data=iris, cex=0.5, pch=3, col=Species) 
points(Sepal.Width~Sepal.Length, data=iris[iris$Petal.Width > mean(iris$Petal.Width), ], pch=1, col=4, cex=1.2)
abline(lm(iris[iris$Species=="setosa",2]~ iris[iris$Species=="setosa",1]), col="purple", lwd=2)
legend("topleft", title = "Species", c("I. setosa", "I. versicolor", "I. virginica", "con pétalos > media"), col = c(1,2,3,4),
       text.col = "black", pch = c(3, 3, 3, 1),
       merge = FALSE, bg = "gray90" )

       
# 6. Características de la ventana gráfica

# Las modificaciones respecto a las características de la ventana del gráfico se pueden cambiar usando la función
# 'par'. Esta función tiene muchos argumentos, todos con un default. 

# a) Se pueden modificar los márgenes del borde del panel al borde del gráfico con 'mar'. En una ventana elabora 
# este gráfico.
plot(Sepal.Width~Sepal.Length, data=iris, pch=21, col=1, bg=rainbow(20)) 
# Abre una segunda ventana (activa) cambia 'mar' vuelve a poner la gráfica para comparar ambos gráficos.
x11()
par(mar=c(4,4,1,3)) 
plot(Sepal.Width~Sepal.Length, data=iris, pch=21, col=1, bg=rainbow(20)) 

# Uno de los argumentos de 'par' mas utilizados, es el 'mfrow' que indica el numero de filas y columnas en lo puedes
# dividir la ventana gráfica:
par(mfrow=c(2,1))
plot(1:10)
plot(1:10, col=2, typ="p")

# También puedes poner 4 graficos en una ventana:
par(mfrow=c(2,2))
plot(1:10, col=1, typ="p")
plot(1:10, col=2, typ="l")
plot(1:10, col=3, typ="o")
plot(1:10, col=4, typ="h")


# 7. Gráficos usando la librería 'lattice'

# Principalmente mediante el formato de fórmula, y los argumentos no se añaden fuera del parentesis, sino dentro. 
# Así es la estructura con que se elaboran las gráficas:
library(lattice)
xyplot(Sepal.Width~Sepal.Length, data=iris)
xyplot(Sepal.Width~Sepal.Length, data=iris, col=2)
xyplot(Sepal.Width~Sepal.Length, data=iris, groups=Species)
xyplot(Sepal.Width~Sepal.Length, data=iris, groups=Species, auto.key=T)

# Un ejemplo un poco más sofisticado es para hacer gráficos condicionales en tres diferentes paneles:
xyplot(Sepal.Width~Sepal.Length, data=iris, 
       panel = function(x, y) {
           panel.grid(h = -1, v = 2)         # añade el 'grid'
           panel.xyplot(x, y, pch=3, cex=.5) # especifica los detalles de los puntos, tipo y tamaño
           panel.lmline(x, y, col="orange")	 # adiciona el modelo lineal.
       		})

# Se pueden hacer otros gráficos utilizando las funciones como 'histogram', 'barchart', 'bwplot', entre otras.
bwplot(Species ~ Sepal.Width, data=iris, xlab="Sepal.Width")
histogram(~Sepal.Width, data=iris, col="purple")
barchart(Sepal.Width ~ Species, data=iris, col="orange")

# Esta librería es excepcionalmente útil para hacer gráficas condicionales o gráficos para subconjuntos de datos.
# Eso se logra con un argumento que tiene una linea indicando el condicional:
histogram(~Sepal.Width|Species, data=iris, col="grey")
xyplot(Sepal.Width~Sepal.Length|Species, data=iris)
dotplot(variety ~ yield | year, data=barley)

# Para hacer gráficos condicionales con especificaciones sofisticadas en los paneles
xyplot(Sepal.Width~Sepal.Length|Species, data=iris, 
       panel = function(x, y) {
           panel.grid(h = -1, v = 2)         # añade el 'grid'
           panel.xyplot(x, y, pch=3, cex=.5) # especifica los detalles de los puntos, tipo y tamaño
           panel.lmline(x, y, col="orange")	 # adiciona el modelo lineal, condicional al factor "Species"
       		})

       		
# 8. Gráficos con la librería 'ggplot2'.

# Esta es la librería favorita para hacer gráficos con formato de calidad para publicación. Es versátil y un poco
# compleja, pero puedes elaborar prácticamente cualquier gráfico. Aqui sólo damos un ejemplo, pues usaremos esta
# librería mas veces en el futuro.
require(ggplot2)
qplot(data=iris, x=Sepal.Length, y=Sepal.Width, geom=c("point"))

