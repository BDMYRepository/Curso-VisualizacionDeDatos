# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # RBasica D: Gr�ficos 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# 1. La funci�n 'plot' de la librer�a basica.

# Existen muchos paquetes distintos para hacer una gran diversidad de gr�ficos, algunos muy sofisticados tanto en
# formato como en complejidad. La mas usada es la funci�n 'plot' del paquete 'base', que por ser funci�n muy general,
# te devuelve una gr�fica distinta dependiendo del objeto sobre el cual sea aplicada. Por ejemplo:

# a) Funci�n 'plot' sobre un vector (por ejemplo, una variable). En el eje Y quedan representados los valores del
# vector, pero en el eje dde las X �nicamente coloca las "entradas" o n�meros de la fila correspondiente (nota el
# t�tulo del eje "Index").
data(iris)
summary(iris)
plot(iris[,1])

# b) Funci�n 'plot' sobre dos vectores especificados como dos argumentos separados por una coma. Cada punto tiene
# una valor para el eje X y otra para el Y, se trata de un gr�fico t�pico de XY.
plot(iris[,1], iris[,2]) 

# Con la funci�n 'plot' tenemos que especificar lo que va a graficar de alguna de dos maneras: indicando los vectores (x=.., y=) o 
# usando el formato de formula (yy~xx). En el caso de esta �ltima puedes especificar el data.frame en un argumento separado:
plot(x=iris[,1], y=iris[,2])
plot(iris[,2]~iris[,1])
plot(Sepal.Width~Sepal.Length, data=iris)

# c) Funci�n 'plot' sobre una tabla o matriz produce gr�ficas pareadas de XY para todas las combinaciones de los
# valores de las columnas en dicha tabla. La diagonal corresponde a los gr�ficos de cada columna contra si misma
# por lo que unicamente aparece el nombre de la columna en cuesti�n. Los gr�ficos abajo de la diagonal son imagen
# en el espejo de los de arriba de la diagonal.
plot(iris)

# d) Funci�n 'plot' sobre la funci�n 'table' produce un histograma de frecuencias absolutas que han sido calculadas
# previamente obtenidas con 'table'.
plot(table(iris[,4]))
table(iris[,4])

# Los gr�ficos obtenidos son muy �tiles como gr�ficos de trabajo ("working plots") ya que con pocos argumentos se
# logran ver tendencias y dispersiones. Sin embargo, hay una serie de argumentos que pueden usarse para mejorar el
# aspecto de la gr�fica. Actualmente, la est�tica de los gr�ficos en R ha sido desarrollada sobre todo con la 
# librer�a 'ggplot2' para fines de una publicaci�n. 


# 2. La funci�n 'boxplot' de la librer�a b�sica

# Para hacer gr�ficos de cajas y bigotes se usa la funci�n 'boxplot' que puede ser aplicada sobre un vector, o una
# lista de varios vectores separados por una coma:
boxplot(iris$Sepal.Length)
boxplot(iris$Sepal.Length, iris$Sepal.Width, iris$Petal.Length, iris$Petal.Width)

# Tambi�n puedes aplicar la funci�n sobre un data-frame (nota que la columna 5 del objeto previo a aplicar la funci�n
# para elaborar el gr�fico, pues la columna 5 tiene caracteres de texto.
boxplot(iris[,-5])

# Tambi�n puedes usar una sintaxis tipo f�rmula: Y~X (que se lee Y en funci�n de X):
boxplot(iris[,1]~iris[,5])
boxplot(Sepal.Length~Species, data=iris)

# Para conocer que representan los l�mites de las cajas y los bigotes puedes consultar la funci�n 'boxplot.stats'
# en la documentaci�n de ayuda de la funci�n.


# 3. La funci�n 'hist', 'barplot' y 'dotchart'.

# La funci�n 'hist' primero obtiene las frecuencias absolutas de un vector num�rico y despu�s hace un histograma con
# el resultado. 
hist(iris[,1])

# Es una funci�n con muchos argumentos, de los cu�les 'breaks' especifica el n�mero de veces que se parte el eje de
# las x para producir los intervalos. Este argumento puede ser especificado mediante un vector, indicando los valores
# del eje x donde este se va a partir. Por ejemplo, si quieres s�lo 4 intervalos, entonces hay 3 breaks:
hist(iris[,1], breaks=3)

# La funci�n 'barplot' sirve para hacer gr�ficos de barras cuando especificas el vector a ser graficado y el vector
# de las categor�as. Es una funci�n mas general que la de 'hist'. 
barplot(dpois(0:4,0.7),names.arg=c(0,1,2,3,4))

# La funci�n 'dotchart' hace gr�ficos de puntos para una �nica variable con el objetivo ver dispersi�n y datos
# extremos. Puedes hacerla condicional a un factor.
dotchart(iris[,1]) 
dotchart(iris$Petal.Length,groups=factor(iris$Species),col=iris$Species)  
 
# Recomendamos explora los archivos de ayuda de estas funciones gr�ficas para ver el potencial al cambiar algunos
# de los argumentos.


# 4. Aspectos est�ticos generales de gr�ficos en R

# En t�rminos de lenguaje, la mayor�a de las graficas en R tienen la misma estructura y comparten los mismos 
# argumentos. Modificando algunos de estos argumentos puedes mejorar los gr�ficas y con ello su interpretaci�n.

# a) Color:
# El color puede definirse usando nombres en ingl�s entre comillas dobles, o n�meros de la paleta:
plot(Sepal.Width~Sepal.Length, data=iris, col="red") 
plot(Sepal.Width~Sepal.Length, data=iris, col=1)
plot(Sepal.Width~Sepal.Length, data=iris, col=Species)

# Pueden definirse distintos colores para borde y relleno:
hist(iris[,1], col="green", border="blue")

# Hay una paleta de colores pre-definidos en R en la librer�a 'graphics'.
plot(Sepal.Width~Sepal.Length, data=iris, pch=16, col=rainbow(20)) 
?palette

# Para saber los nombres de los colores como est�n definidos:
colors()
example(colors)
# Un ejemplo on-line:
http://research.stowers-institute.org/efg/R/Color/Chart/index.htm

# b) S�mbolos y formas:
# Es posible cambiar los s�mbolos con el argumento pch ("point character"). A partir del pch=21 se trata de s�mbolos
# que un color de relleno ('bg') y otro para el borde ('col').
plot(Sepal.Width~Sepal.Length, data=iris, col="red", pch=2)
plot(Sepal.Width~Sepal.Length, data=iris, pch=21, col=1, bg=rainbow(20)) 

# Puedes ponerle un s�mbolo a cada grupo.
plot(Sepal.Width~Sepal.Length, data=iris)
points(Sepal.Width~Sepal.Length, data=iris[iris$Species=="virginica",], pch=21, col=1, bg="red")
points(Sepal.Width~Sepal.Length, data=iris[iris$Species=="setosa",], pch=22, col=1, bg="cyan")
points(Sepal.Width~Sepal.Length, data=iris[iris$Species=="versicolor",],pch=24, col=1, bg="green")

# Es posible cambiar de tipo de gr�fico usando el argmento "typ" para indicar linea ("l"), puntos ("p"), ambos sin
# que cruce la linea por el punto ("b"), y cruzando la linea por el punto ("o").
plot(Sepal.Width~Sepal.Length, data=iris, col="red", pch=2, typ="l")
plot(Sepal.Width~Sepal.Length, data=iris, col="blue", pch=3, typ="b")
plot(Sepal.Width~Sepal.Length, data=iris, col="orange", pch=4, typ="o")

# Es posible cambiar el tipo de l�nea con 'lty':
plot(Sepal.Width~Sepal.Length, data=iris, col="red", pch=2, typ="l", lty=2)

# c) Tama�o
# Es posible cambiar el tama�o del s�mbolo con el argumento 'cex' que es un valor de tama�o relativo.
plot(Sepal.Width~Sepal.Length, data=iris, col=1, pch=21, bg=3, typ="p", cex=0.5)
plot(Sepal.Width~Sepal.Length, data=iris, col=1, pch=21, bg=3, typ="p", cex=1.5)

# Tambi�n puedes hacer que el tama�o sea proporcional al valor de la variable y:
plot(Sepal.Width~Sepal.Length, data=iris, col=1, pch=21, bg=3, typ="p", cex=Sepal.Width)

# d) Atributos de los ejes y leyendas:
# Puedes modificar los l�mites de los ejes y y x con los argumentos 'xlim' y 'ylim':
plot(Sepal.Width~Sepal.Length, data=iris, pch=21, col=1, bg=rainbow(20)) 
plot(Sepal.Width~Sepal.Length, data=iris, pch=21, col=1, bg=rainbow(20), xlim=c(3,9), ylim=c(0,6))

# Puedes mover el �ngulo de los valores en el eje y con el argumento 'las'.
hist(iris[,1], col="blue", las=2)
boxplot(Sepal.Length~Species, data=iris, las=2)

# Puedes poner t�tulos a las gr�ficas, a�adiendo los argumentos: 
boxplot(Sepal.Length~Species, data=iris, las=1,
	xlab="Lindo", ylab="Fant�stico", main="Quiero un caf�!" )

	
# 5. Gr�ficos por capas superpuestas

# Otro aspecto muy importante de la funci�n 'plot' (y otras del mismo tipo) es la capacidad de sobreponer
# funciones graficas distintas para adicionar capas al mismo gr�fico. Ve a�adiendo una a una las l�neas de c�digo a
# continuaci�n y revisa qu� aspectos se modifican en la gr�fica:
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
legend("topleft", title = "Species", c("I. setosa", "I. versicolor", "I. virginica", "con p�talos > media"), col = c(1,2,3,4),
       text.col = "black", pch = c(3, 3, 3, 1),
       merge = FALSE, bg = "gray90" )

       
# 6. Caracter�sticas de la ventana gr�fica

# Las modificaciones respecto a las caracter�sticas de la ventana del gr�fico se pueden cambiar usando la funci�n
# 'par'. Esta funci�n tiene muchos argumentos, todos con un default. 

# a) Se pueden modificar los m�rgenes del borde del panel al borde del gr�fico con 'mar'. En una ventana elabora 
# este gr�fico.
plot(Sepal.Width~Sepal.Length, data=iris, pch=21, col=1, bg=rainbow(20)) 
# Abre una segunda ventana (activa) cambia 'mar' vuelve a poner la gr�fica para comparar ambos gr�ficos.
x11()
par(mar=c(4,4,1,3)) 
plot(Sepal.Width~Sepal.Length, data=iris, pch=21, col=1, bg=rainbow(20)) 

# Uno de los argumentos de 'par' mas utilizados, es el 'mfrow' que indica el numero de filas y columnas en lo puedes
# dividir la ventana gr�fica:
par(mfrow=c(2,1))
plot(1:10)
plot(1:10, col=2, typ="p")

# Tambi�n puedes poner 4 graficos en una ventana:
par(mfrow=c(2,2))
plot(1:10, col=1, typ="p")
plot(1:10, col=2, typ="l")
plot(1:10, col=3, typ="o")
plot(1:10, col=4, typ="h")


# 7. Gr�ficos usando la librer�a 'lattice'

# Principalmente mediante el formato de f�rmula, y los argumentos no se a�aden fuera del parentesis, sino dentro. 
# As� es la estructura con que se elaboran las gr�ficas:
library(lattice)
xyplot(Sepal.Width~Sepal.Length, data=iris)
xyplot(Sepal.Width~Sepal.Length, data=iris, col=2)
xyplot(Sepal.Width~Sepal.Length, data=iris, groups=Species)
xyplot(Sepal.Width~Sepal.Length, data=iris, groups=Species, auto.key=T)

# Un ejemplo un poco m�s sofisticado es para hacer gr�ficos condicionales en tres diferentes paneles:
xyplot(Sepal.Width~Sepal.Length, data=iris, 
       panel = function(x, y) {
           panel.grid(h = -1, v = 2)         # a�ade el 'grid'
           panel.xyplot(x, y, pch=3, cex=.5) # especifica los detalles de los puntos, tipo y tama�o
           panel.lmline(x, y, col="orange")	 # adiciona el modelo lineal.
       		})

# Se pueden hacer otros gr�ficos utilizando las funciones como 'histogram', 'barchart', 'bwplot', entre otras.
bwplot(Species ~ Sepal.Width, data=iris, xlab="Sepal.Width")
histogram(~Sepal.Width, data=iris, col="purple")
barchart(Sepal.Width ~ Species, data=iris, col="orange")

# Esta librer�a es excepcionalmente �til para hacer gr�ficas condicionales o gr�ficos para subconjuntos de datos.
# Eso se logra con un argumento que tiene una linea indicando el condicional:
histogram(~Sepal.Width|Species, data=iris, col="grey")
xyplot(Sepal.Width~Sepal.Length|Species, data=iris)
dotplot(variety ~ yield | year, data=barley)

# Para hacer gr�ficos condicionales con especificaciones sofisticadas en los paneles
xyplot(Sepal.Width~Sepal.Length|Species, data=iris, 
       panel = function(x, y) {
           panel.grid(h = -1, v = 2)         # a�ade el 'grid'
           panel.xyplot(x, y, pch=3, cex=.5) # especifica los detalles de los puntos, tipo y tama�o
           panel.lmline(x, y, col="orange")	 # adiciona el modelo lineal, condicional al factor "Species"
       		})

       		
# 8. Gr�ficos con la librer�a 'ggplot2'.

# Esta es la librer�a favorita para hacer gr�ficos con formato de calidad para publicaci�n. Es vers�til y un poco
# compleja, pero puedes elaborar pr�cticamente cualquier gr�fico. Aqui s�lo damos un ejemplo, pues usaremos esta
# librer�a mas veces en el futuro.
require(ggplot2)
qplot(data=iris, x=Sepal.Length, y=Sepal.Width, geom=c("point"))

