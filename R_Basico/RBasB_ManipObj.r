# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # RBasica B: Generación y Manipulación de Objetos
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# 1. Generación de datos en R

# La función 'c' sirve para enlistar elementos dentro de un vector:
c(8,15,72,24)
cc <-c("esp", "ing", "por")
cc

# El operador ':' sirve para generar secuencias de número enteros (positivos o negativos), y tiene prioridad sobre
# otros operadores:
b<-c(37:45)
b
bb<-c(-15:31)
bb
1:10-1		# primero genera la secuencia y luego le resta 1
1:(10-1)	# primero le resta 1 a 10, y luego general la secuencia

# La función 'seq' genera secuencias de números reales, y el tercer argumento especifica el intervalo que los separa:
seq(1, 5, 0.5)

# La función 'rep' crea un vector con elementos idénticos. El primer argumento especifica el elemento, el segundo
# el número de repeticiones). Se puede usar con distintos argumentos para generar listados de números con un diseño
# particular:
rep(1, 4)
rep(1:4, 2)
rep(1:4, each = 2)
rep(1:4, each = 2, times = 3)
 
# Para crear un factor (un vector de categorías para ser usado en diseños factoriales) se usa la función 'factor':
factor(1:3) 
factor(rep(1:4, each = 2, times = 3))

# La función 'gl' genera series regulares de elementos que pueden representar los niveles de un factor; se puede
# especificar la longitud del vector, asi como etiquetas o nombres específicos para cada nivel:
k=3 		# número de niveles)
n=5 		# número de repeticiones por nivel
gl(k,n) 
gl(k,n, length=30)
gl(2,6,label=c("Macho","Hembra")) 

# Para crear una matriz se usa la función 'matrix'
matrix(data=5, nr=2, nc=2)
matrix(1:6, 2, 3, byrow=TRUE) 	# el argumento 'byrow' indica acomodar los elementos por filas.
dd<-c(1:20) 					# creamos un vector de nombre dd con 20 elementos.
dd
matrix(dd,nc=4) 				# creamos una matriz con ese vector, indicando número de columnas nc=4
Y=matrix(dd,nc=4) 				# le asignamos esa matriz al nombre 'Y'
Y

# Para crear una tabla se usa la función 'data.frame'. Los objetos deben tener el mismo número de elementos:
x <- 1:4; n <- 10; M <- c(10, 35); y <- 2:4; z<-c("macho","hembra","macho","hembra")
data.frame(x, n)
data.frame(x, M)
data.frame(x, y)


# 2. Generación de datos a partir de variables aleatorias

# R tiene la posibilidad de generar datos provenientes de distribuciones aleatorios teóricas, como por ejemplo,
# la Distribución Normal. La función 'rnorm' devuelve un vector de 50 números aleatorios que provien de una
# población de datos con distribución normal, media 2 y desvíación estándar 0.5:
rnorm(50,2,0.5) 

# R tiene una serie de distribuciones de variables aleatorias pre-definidas. Exploralas usando la función 'help'.
# Entre las más usadas están:
rbinom 		# Binomial
rpois 		# Poisson
rnbinom 	# Binomial Negativa
rf			# Distribucion de Fisher


# 3. Manipulación y operaciones con columnas completas en una tabla.

# Cuando deseas aplicar alguna función a una columna de una tabla, puedes identificarla dentro de la tabla usando
# el signo de '$'. Por ejemplo, si quiero obtener el logaritmo de los elementos en la columna M de la siguiente
# tabla:
tabla<-data.frame(x, M)
log(tabla$M)

# Si deseo colocar ese resultado como una nueva columna del objeto 'tabla', y la quiero nombrar "logM", entonces
# escribo:
tabla$logM<-log(tabla$M)
tabla

# Si deseo multiplicar una columna por otra de una tabla:
tabla$M * tabla$logM

# Es posible hacer gráficas o aplicar otras funciones como ajustar modelos estadísticos con columnas de una tabla:
plot(tabla$M * tabla$logM)


# 4. Manipulación de subconjuntos a partir de objetos ("sub-setting")

# Una de las grandes fortalezas de R es que permite el acceso a los elementos de un objeto a través de una selección
# de subconjuntos de éstos. El "sub-setting" es una manera eficiente y flexible de acceder selectivamente a los
# elementos de un objeto, y se puede hacer mediante el uso de corchetes '[]', o bien, con la función 'subset'. 

# Si el objeto es un vector, solo se requiere dar la posición del elemento en el vector o su nombre entre comillas:
aa = c(3:15)
aa
aa[3] 

# Si el objeto es una matriz o una tabla, se tiene que indicar el valor de la i-ésima fila y la j-ésima columna,
# separadas por una coma. Siempre se designa la fila en el primer espacio antes de la coma, y la columna en el
# segundo espacio después de la coma. Si se deja vacío, indica la totalidad de la fila o columna, según la posicion
# de la coma:
Y
Y[2,4]		# obtiene el elemento que está en la segunda fila, cuarta columna
Y[, 3] 		# obtiene todas las filas de la tercera columna.

# Una vez accedido a ciertos elementos, es posible aplicar operadores y funciones a esos subconjuntos en particular.
Y[c(1,3,5), 3]*2	# extrae los elementos de las filas 1,3,5 en la columna 3, y los multiplica por 2
Y
Y[-1,] 				# suprime la primera fila en el resultado, mas no en el objeto Y
Y

# Dado que el objeto no ha sido modificado, para generar un nuevo objeto con el resultado de ese subconjuto
# o instrucción, debo re-asignarles un nombre mediante los operadores '<-' , '->' o '=':
Y.1<-Y[c(1,3,5), 3]*2
Y.1
Y[Y>=10]<-0 		# todos los elementos del objeto Y que sean mayores o iguales a 10 serán sustituido por 0
Y

# El sistema de selección de subconjuntos es fácilmente extensible a las tablas o data-frames. Tomemos la tabla
# 'iris' (ejemplo en R). Se trata de una tabla con 4 variables morfométricas provenientes de 3 especies de flores
# con 50 ejemplares por cada especie.
iris         
dim(iris)    		# pide las dimensiones de la tabla iris
names(iris)  		# pide los nombres de las columnas en iris
iris[,"Species"] 	# selecciona la columna por su nombre
iris$Species     	# selecciona la columna por su asignación en la tabla 'iris'

# Con subsetting puedes seleccionar cualquier extracto del objeto usando definiciones en la sintaxis del código.
# Antes de la coma especificas las filas de interés; después de la coma especificas las columnas de interés. La
# siguiente línea de código es para extraer todos los elementos que cumplan con el criterios de: filas que en la
# columna iris$Species contengan la palabra "virginica"; y columnas de la 1 a la 4:
iris[iris$Species=="virginica",c(1:4)]
 
# En otras tablas puedes seleccionar algunos elementos que cumplan con mas de un criterio. Para eso se usan los
# operadores comparativos:
dat<-data.frame(x,n,M,z)			# define la tabla y le asigna el nombre dat
dat									# llama al objeto dat
dat[dat$x>=3 & dat$M==10,"n"]		# extrae los elementos que cumplan con dos criterios		
dat[dat$x>=3 & dat$M==10,"n"]<-8	# sustituye dichos elementos por 8 e la tabla dat
dat									# llama al objeto dat para ver los cambios


# El "sub-setting" es muy utilizado en la elaboración de gráficos. Por ejemplo, este comando produce un gráfico de
# caja para las filas de la columna Species que corresponden con el nombre virginica, usando los valores de las
# primeras 4 columnas de la tabla 'iris':
boxplot(iris[iris$Species=="virginica",c(1:4)]) 
 
# Este produce un gráfico X-Y para todas las filas de la columna 2 en función de todas las filas de la columna 1.
plot(iris[,2] ~ iris[,1])

# Este produce un histograma de los valores de las fila de la columna Species que corresponden con el nombre
# versicolor, usando los valores de la variable en la columna 1.
hist(iris[iris$Species=="versicolor",c(1)])

# Se puede hacer sub-setting usando la función 'subset':
dat<-data.frame(x,n,M,z)
subset(dat, x > 2 | x < 2, select = c(M))		 # elementos de la columna M cuyo valor en x sea mayor o menor que 2
subset(dat, x > 2 & z=="macho", select = c(M,n)) # elementos de las columnas M y n cuyo valor  en x sea mayor que 2
												 # y en z sean macho.

