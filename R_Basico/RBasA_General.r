# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # RBasica A: Generalidades 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# 1. Ventanas y paquetes en R

# R es un lenguaje de programación y una plataforma que permite realizar distintas acciones mediante instrucciones
# que escribes en una ventana llamada de aquí en adelante "consola". Las instrucciones son dadas mediante funciones
# definidas y agrupadas dentro de "paquetes" o "librerias". Para comenzar a usar R debes instalar el programa en tu
# computadora, junto con las librerías que vas a usar. 

# El programa R, sus versiones actualizadas y todos los paquetes con funciones, asi como otra información relevante
# se encuentre en los repositorios de R conocidos como CRAN (Comprehensive R Archive Network). Distintos servidores
# distribuidos en todo el mundo, conforman el CRAN y son conocidos como los "CRAN mirrors" (de espejo). Para instalar
# el programa requieres escoger un CRAN mirror. 

# Las funciones están organizadas en paquetes. El paquete denominado 'base' constituye el núcleo de R y contiene las
# funciones básicas del lenguaje. Cada paquete contiene un directorio denominado R asociado a un archivo con el mismo
# nombre del paquete (por ejemplo, para el paquete 'base', existe el archivo R HOME/library/base/R/base). Cuando
# descargas un paquete, esta información se graba en tu disco duro en un archivo en formato ASCII que contiene todas
# las funciones de ese paquete.

# Además de los paquetes básicos, existen una gran cantidad de paquetes (desarrollados por los usuarios de forma
# independiente) que se encuentran en los respositorios de R en los CRAN mirrors. Para instalar un paquete primero 
# necesitas escoger un CRAN mirror desde la consola de R (o R-studio), pulsando el menú de Paquetes o bien escribiendo
# la siguiente función en la consola que te permitirá escogerlo de una lista que aparece en una ventana aparte:
chooseCRANmirror()

# La función para instalar paquetes es la siguiente, y debes escribir el nombre exacto (respetando mayúsculas) entre
# paréntesis y con comillas simples. Otra alternativa es pulsando el menú Paquetes que te permite escogerlo de una
# ventana con una larga lista que tiene todos los paquetes existentes al momento. Este es un comando que se requiere
# una sola vez para descargar e instalar los archivos de ese paquete en tu disco duro. Por ello, necesitas estar
# conectado a la red para hacerlo. Por ejemplo, para instalar el paquete 'lattice':
install.packages('lattice')

# Una vez instalado ese paquete, será necesario llamarlo en cada sesión nueva de R para hacerla disponible. Esto se
# hace con cualquiera de las  funciones 'library' o 'require'. Estas deben usarse seguidas del nombre del paquete
# entre paréntesis.
library(lattice)
require(lattice)

# La ventana de la consola es donde se escriben los comandos, después de un indicador o prompt '>' que notifica
# cuando R está listo para recibir la siguiente instrucción. La tecla 'esc' aborta la tentativa de esa línea de
# comando y da la señal para que aparezca un nuevo prompt. Dos prompts '> >' seguidos invalida esa línea de comando.
# Si aparece un signo '+' es que la linea de comando está incompleta y requiere ser completada ante de devolver un
# resultado. Si aparece un mensaje de "Error" significa que el comando o instrucción no tuvo efecto. Si aparece un
# 'Mensaje de aviso' significa que R efectuó la instrucción anterior, pero tuvo algún obstáculo. Este es descrito
# inmediatamente.

# Con las flechas del arriba y abajo del teclado, aparece la linea de comando inmediata anterior y es una manera
# de no tener que re-escribir dichas líneas cada vez. El signo de número '#' indica un comentario que no será
# tomado en cuenta hasta que aparezca un nuevo prompt.

# La ventana de gráficos es donde aparecen todos los gráficos de R y se abre en cuanto se escribe una función para 
# graficar. La ventana gráfica activa es en la cual se producen los gráficos que indicaste en la consola, y solo
# hay una ventana activa a la vez. Es posible pedir más de una ventana de gráfico, usando la siguiente función pero
# esto desactivará la ventana gráfica anterior. 
x11()

# Se pueden acomodar las ventanas usando el menu Ventanas<Cascada

# 2. Funciones en R

# Para ejecutar una función se debe escribir el comando correctamente después del prompt ('>'). Si la función es
# ejecutada exitosamente, el programa devuelve, ya sea: 
# i)un prompt nuevo;
zz<-sqrt(25)
# ii)un resultado que aparece en la pantalla; o
sum(zz,2)
# iii)un gráfico en la ventana activa de gráficos.
plot(x=c(6,8,10,12,14,16), y=c(2,4,6,8,10,12))

# Si la consola devuelve el mensaje de 'Warning' o 'Mensaje de aviso' quiere decir que la función fue llevada a cabo,
# pero advierte sobre potenciales problemas. El mensaje de 'Error' implica que la función no fue llevada a cabo.

# R no usa archivos temporales y la lectura y grabación de archivos solo se realiza para la entrada y salida de datos
# y resultados, ya sean numéricos o gráficos. Esto quiere decir que para volver a ver un resultado es necesario volver
# a ejecutar esa línea de comando. Aunque es posible guardar una sesión completa de R usando el menú, esto no es 
# usual ya que puedes volver a correr las lineas de comando al sólo correrlas (escribirlas o copiarlas) de nuevo en
# la consola.

# En R, las funciones siempre se escriben seguidas de un paréntesis, en donde se escriben los argumentos que han sido
# específicamente definidos y se requieren para esa funcion. Los argumentos de una función siempre van separados por
# una coma. En algunas funciones el paréntesis puede quedar vacío.

# Cada función cuenta con algunos argumentos que es obligatorio definir, y otros que son opcionales. Estos últimos
# están cuentan con una opción dada por "default". Si un usuario quiere escoger otra opción, debe hacerlo explícito
# en cada caso. Cuando un argumento no es modificado, R usará la opción "default". 
log(100, base = exp(1))
log(10)
log(10,base=10) 

# Es importante notar que aplicar una función NO CREA un objeto, aunque si produce un resultado. Los resultados
# pueden ser visualizados directamente en la pantalla, guardados como un objeto con un nombre en una sesión de R,
# o grabados directamente en una carpeta del disco duro (particularmente para el caso de gráficos).
sum(32,43)
yy
yy<-sum(32,43)
yy

# Toda la información relativa a una función la puedes obtener tecleando 'help' seguido del nombre de la función
# entre paréntesis. Si unicamente escribes la función y das enter aparecerá el código programático de la función
# como tal o la indicación si es una primitiva. Modificando ese código es la forma de adecuar una función para
# tu conveniencia particular.
help("log")
log


# 3. Objetos en R

# R es un lenguaje orientado a objetos, lo que significa que las variables, datos, funciones, resultados, etc.,
# se guardan en la memoria activa del computador en forma de objetos con un nombre específico dado por el usuario
# en cada sesión. Para poder ver los objetos que se encuentran en una sesión activa de R, se puede escribir la
# función de enlistar 'ls'. 
ls()

# La función para remover objetos de esa sesión es 'rm', y puede aplicarse a todos los objetos guardados en una
# sesión de R o sólo a algunos: 
rm(yy)
ls()
rm(list=ls(all=TRUE))
rm(list=ls())
ls()

# Los objetos en R se manipulan mediante funciones y operadores que, a su vez, pueden ser tratados como nuevos 
# objetos. El nombre de un objeto se asigna con el operador '<-', '->' o '=', y puede estar hecho de letras,
# números o signos de puntuación.
y.y<-10*10
z.12<-81/9

# Para ver el tipo (numérico, caracter de texto, logico, etc.) o longitud de un objeto se pueden usar las funciones:
mode(y.y)
length(y.y)

# El punto y coma ";" sirve para separar comandos en una misma linea, sin ejecutar (pulsar enter) cada uno.
# Los textos son siempre considerados caracteres ("character string") y deben ir entre comillas dobles:
A <- "mandarina"; compar <- TRUE; mode(A)
mode(compar)

# Los números entre corchetes del lado izquierdo de cada línea del resultado marcan el número del elemento que sigue
# inmediatamente a continuación en esa línea, y naturalmente cambian si altero el ancho de la consola. 
A
muchos<-seq(0,50)
muchos

# R es sensible a mayúsculas, pero no a los espacios, por lo que no debes preocuparte de poner estos últimos:
compar
Compar
sum    (3,2)
sum(3,2)


# 4. Clasificación de objetos en R

# a) Vector.- una columna o una fila de elementos, que pueden ser numéricos, de caracteres de texto, de operadores
# lógicos, etc. Cuando se trata de una variable categórica, el vector puede ser tratado como un factor, y el número
# de niveles del factor corresponden a las categorías de dicha variable.
vect<- c(2,4,6,3,7,8,9,2)
vect

# Puedes preguntar si un vector tiene elementos de un tipo en particular:
is.factor(vect)
is.numeric(vect)

# Cuando se trata de texto, R automaticamente toma esa variable como categórica:
var.cat<- c("1", "2", "3", "4", "5")
mode(var.cat)

# b) Matriz.- es un arreglo bidimensional de columnas y renglones, sobre el cual se pueden aplicar operaciones
# algebraicas.
matr<- rbind(c(1,2,3),c(4,5,6),c(7,8,9))
matr
is.factor(matr)
is.numeric(matr)

# c) Arreglo.- es un arreglo de dimensiones k>2. Se puede definir una matriz o un arreglo sin definir su contenido:
n=3
k=2
j=4
samp=array(dim=c(n,k,j))
samp

is.factor(samp)
is.numeric(samp)

# Los vectores, matrices y arreglos solo pueden tener elementos del mismo tipo (e.g. numéricos, lógicos, etc.)

# d) Dataframe.- es una tabla compuesta de uno o más vectores de la misma longitud, pero con elementos que pueden
# ser de diferentes tipos.
iris
fix(iris)

# e) Lista.- una colección de con objetos de diferente tipo (e.g. vectores, arreglos, tablas, otras listas, etc).
# Es la forma como R devuelve los resultados de funciones complejas:
ls()
modelo<-lm(c(6,8,10)~c(2,4,6))
ls(modelo)

# Existen comandos que permiten conocer las características generales de un objeto:
str(vect)  		#Devuelve la estructura un objeto
str(iris) 

dim(matr)  		#Devuelve las dimensiones de una matriz, tabla o arreglo
dim(samp) 
dim(iris)

head(iris)  	#Devuelve las primeras 6 filas de una tabla.
names(iris) 	#Devuelve los nombres de las columnas de una tabla

summary(vect)	#Devuelve el resumen estadístico de un objeto por columnas, sea esta una o varias.
summary(iris)

# Usar el mismo nombre para dos objetos distintos implica perder la asignación del primer objeto, y no es
# recomendable usar letras comunes en notación estadística para nombrar objetos creados por un usuario. Por 
# ejemplo, no uses como nombre la letra "x", "F" o "T").
xx<-4
xx
xx<-"xx ya no es el mismo"
xx

# Para poder convertir un objeto de una clase a otra se usa la función 'as...'. Al llevar a cabo la conversión
# se suelen afectar distintos atributos del objeto. Por ejemplo, si quieres convertir un vector de números a un
# factor (o variable categórica con niveles a>1):
v.num<-c(1,2,3,4,5); yy<-c(2,4,6,8,10)
plot(y=yy,x=v.num, type="l")
v.fac<-as.factor(v.num)
plot(y=yy,x=v.fac, type="l")


# 4. Operadores en R

# Hay 3 tipos de operadores: aritméticos, comparativos y lógicos. En general no requieren paréntesis en su sintaxis.
# Los operadores aritméticos y comparativos actúan usando dos elementos (x + y, a < b), los lógicos pueden actuar
# sobre uno o dos elementos. Los operadores aritméticos actúan sobre variables de tipo numérico y lógico; en este
# último caso los valores lógicos son forzados a valores numéricos. Los operadores comparativos pueden actuar sobre
# cualquier tipo devolviendo uno o varios valores lógicos.
3+4>5				# "3 mas 4 es mayor que 5"
!TRUE				# "lo contrario de TRUE es..." 
10/5!=12/6			# 10 entre 5 no es igual a 12 entre 6
y.y<=50				# los elementos del objeto "yy" son menores o iguales que 50
2*6==3*4			# "2 por 6 es igual a 3 por 4. Se usan dos signos de igual para diferenciar de la instruccion
					# de "asignar".
					

# 5. Ayuda en R

# El signo de interrogación previo al nombre de la función la busca en todas las librerias de R (da el mismo
# resultado que la función 'help'). Doble signo permite buscar con  palabras que se parezcan a la tuya o que
# aparezcan en textos asociados a R ("fuzzy search"):
?lm
help("*")
??average









 






