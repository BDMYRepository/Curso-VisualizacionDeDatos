# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # RBasica A: Generalidades 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# 1. Ventanas y paquetes en R

# R es un lenguaje de programaci�n y una plataforma que permite realizar distintas acciones mediante instrucciones
# que escribes en una ventana llamada de aqu� en adelante "consola". Las instrucciones son dadas mediante funciones
# definidas y agrupadas dentro de "paquetes" o "librerias". Para comenzar a usar R debes instalar el programa en tu
# computadora, junto con las librer�as que vas a usar. 

# El programa R, sus versiones actualizadas y todos los paquetes con funciones, asi como otra informaci�n relevante
# se encuentre en los repositorios de R conocidos como CRAN (Comprehensive R Archive Network). Distintos servidores
# distribuidos en todo el mundo, conforman el CRAN y son conocidos como los "CRAN mirrors" (de espejo). Para instalar
# el programa requieres escoger un CRAN mirror. 

# Las funciones est�n organizadas en paquetes. El paquete denominado 'base' constituye el n�cleo de R y contiene las
# funciones b�sicas del lenguaje. Cada paquete contiene un directorio denominado R asociado a un archivo con el mismo
# nombre del paquete (por ejemplo, para el paquete 'base', existe el archivo R HOME/library/base/R/base). Cuando
# descargas un paquete, esta informaci�n se graba en tu disco duro en un archivo en formato ASCII que contiene todas
# las funciones de ese paquete.

# Adem�s de los paquetes b�sicos, existen una gran cantidad de paquetes (desarrollados por los usuarios de forma
# independiente) que se encuentran en los respositorios de R en los CRAN mirrors. Para instalar un paquete primero 
# necesitas escoger un CRAN mirror desde la consola de R (o R-studio), pulsando el men� de Paquetes o bien escribiendo
# la siguiente funci�n en la consola que te permitir� escogerlo de una lista que aparece en una ventana aparte:
chooseCRANmirror()

# La funci�n para instalar paquetes es la siguiente, y debes escribir el nombre exacto (respetando may�sculas) entre
# par�ntesis y con comillas simples. Otra alternativa es pulsando el men� Paquetes que te permite escogerlo de una
# ventana con una larga lista que tiene todos los paquetes existentes al momento. Este es un comando que se requiere
# una sola vez para descargar e instalar los archivos de ese paquete en tu disco duro. Por ello, necesitas estar
# conectado a la red para hacerlo. Por ejemplo, para instalar el paquete 'lattice':
install.packages('lattice')

# Una vez instalado ese paquete, ser� necesario llamarlo en cada sesi�n nueva de R para hacerla disponible. Esto se
# hace con cualquiera de las  funciones 'library' o 'require'. Estas deben usarse seguidas del nombre del paquete
# entre par�ntesis.
library(lattice)
require(lattice)

# La ventana de la consola es donde se escriben los comandos, despu�s de un indicador o prompt '>' que notifica
# cuando R est� listo para recibir la siguiente instrucci�n. La tecla 'esc' aborta la tentativa de esa l�nea de
# comando y da la se�al para que aparezca un nuevo prompt. Dos prompts '> >' seguidos invalida esa l�nea de comando.
# Si aparece un signo '+' es que la linea de comando est� incompleta y requiere ser completada ante de devolver un
# resultado. Si aparece un mensaje de "Error" significa que el comando o instrucci�n no tuvo efecto. Si aparece un
# 'Mensaje de aviso' significa que R efectu� la instrucci�n anterior, pero tuvo alg�n obst�culo. Este es descrito
# inmediatamente.

# Con las flechas del arriba y abajo del teclado, aparece la linea de comando inmediata anterior y es una manera
# de no tener que re-escribir dichas l�neas cada vez. El signo de n�mero '#' indica un comentario que no ser�
# tomado en cuenta hasta que aparezca un nuevo prompt.

# La ventana de gr�ficos es donde aparecen todos los gr�ficos de R y se abre en cuanto se escribe una funci�n para 
# graficar. La ventana gr�fica activa es en la cual se producen los gr�ficos que indicaste en la consola, y solo
# hay una ventana activa a la vez. Es posible pedir m�s de una ventana de gr�fico, usando la siguiente funci�n pero
# esto desactivar� la ventana gr�fica anterior. 
x11()

# Se pueden acomodar las ventanas usando el menu Ventanas<Cascada

# 2. Funciones en R

# Para ejecutar una funci�n se debe escribir el comando correctamente despu�s del prompt ('>'). Si la funci�n es
# ejecutada exitosamente, el programa devuelve, ya sea: 
# i)un prompt nuevo;
zz<-sqrt(25)
# ii)un resultado que aparece en la pantalla; o
sum(zz,2)
# iii)un gr�fico en la ventana activa de gr�ficos.
plot(x=c(6,8,10,12,14,16), y=c(2,4,6,8,10,12))

# Si la consola devuelve el mensaje de 'Warning' o 'Mensaje de aviso' quiere decir que la funci�n fue llevada a cabo,
# pero advierte sobre potenciales problemas. El mensaje de 'Error' implica que la funci�n no fue llevada a cabo.

# R no usa archivos temporales y la lectura y grabaci�n de archivos solo se realiza para la entrada y salida de datos
# y resultados, ya sean num�ricos o gr�ficos. Esto quiere decir que para volver a ver un resultado es necesario volver
# a ejecutar esa l�nea de comando. Aunque es posible guardar una sesi�n completa de R usando el men�, esto no es 
# usual ya que puedes volver a correr las lineas de comando al s�lo correrlas (escribirlas o copiarlas) de nuevo en
# la consola.

# En R, las funciones siempre se escriben seguidas de un par�ntesis, en donde se escriben los argumentos que han sido
# espec�ficamente definidos y se requieren para esa funcion. Los argumentos de una funci�n siempre van separados por
# una coma. En algunas funciones el par�ntesis puede quedar vac�o.

# Cada funci�n cuenta con algunos argumentos que es obligatorio definir, y otros que son opcionales. Estos �ltimos
# est�n cuentan con una opci�n dada por "default". Si un usuario quiere escoger otra opci�n, debe hacerlo expl�cito
# en cada caso. Cuando un argumento no es modificado, R usar� la opci�n "default". 
log(100, base = exp(1))
log(10)
log(10,base=10) 

# Es importante notar que aplicar una funci�n NO CREA un objeto, aunque si produce un resultado. Los resultados
# pueden ser visualizados directamente en la pantalla, guardados como un objeto con un nombre en una sesi�n de R,
# o grabados directamente en una carpeta del disco duro (particularmente para el caso de gr�ficos).
sum(32,43)
yy
yy<-sum(32,43)
yy

# Toda la informaci�n relativa a una funci�n la puedes obtener tecleando 'help' seguido del nombre de la funci�n
# entre par�ntesis. Si unicamente escribes la funci�n y das enter aparecer� el c�digo program�tico de la funci�n
# como tal o la indicaci�n si es una primitiva. Modificando ese c�digo es la forma de adecuar una funci�n para
# tu conveniencia particular.
help("log")
log


# 3. Objetos en R

# R es un lenguaje orientado a objetos, lo que significa que las variables, datos, funciones, resultados, etc.,
# se guardan en la memoria activa del computador en forma de objetos con un nombre espec�fico dado por el usuario
# en cada sesi�n. Para poder ver los objetos que se encuentran en una sesi�n activa de R, se puede escribir la
# funci�n de enlistar 'ls'. 
ls()

# La funci�n para remover objetos de esa sesi�n es 'rm', y puede aplicarse a todos los objetos guardados en una
# sesi�n de R o s�lo a algunos: 
rm(yy)
ls()
rm(list=ls(all=TRUE))
rm(list=ls())
ls()

# Los objetos en R se manipulan mediante funciones y operadores que, a su vez, pueden ser tratados como nuevos 
# objetos. El nombre de un objeto se asigna con el operador '<-', '->' o '=', y puede estar hecho de letras,
# n�meros o signos de puntuaci�n.
y.y<-10*10
z.12<-81/9

# Para ver el tipo (num�rico, caracter de texto, logico, etc.) o longitud de un objeto se pueden usar las funciones:
mode(y.y)
length(y.y)

# El punto y coma ";" sirve para separar comandos en una misma linea, sin ejecutar (pulsar enter) cada uno.
# Los textos son siempre considerados caracteres ("character string") y deben ir entre comillas dobles:
A <- "mandarina"; compar <- TRUE; mode(A)
mode(compar)

# Los n�meros entre corchetes del lado izquierdo de cada l�nea del resultado marcan el n�mero del elemento que sigue
# inmediatamente a continuaci�n en esa l�nea, y naturalmente cambian si altero el ancho de la consola. 
A
muchos<-seq(0,50)
muchos

# R es sensible a may�sculas, pero no a los espacios, por lo que no debes preocuparte de poner estos �ltimos:
compar
Compar
sum    (3,2)
sum(3,2)


# 4. Clasificaci�n de objetos en R

# a) Vector.- una columna o una fila de elementos, que pueden ser num�ricos, de caracteres de texto, de operadores
# l�gicos, etc. Cuando se trata de una variable categ�rica, el vector puede ser tratado como un factor, y el n�mero
# de niveles del factor corresponden a las categor�as de dicha variable.
vect<- c(2,4,6,3,7,8,9,2)
vect

# Puedes preguntar si un vector tiene elementos de un tipo en particular:
is.factor(vect)
is.numeric(vect)

# Cuando se trata de texto, R automaticamente toma esa variable como categ�rica:
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

# Los vectores, matrices y arreglos solo pueden tener elementos del mismo tipo (e.g. num�ricos, l�gicos, etc.)

# d) Dataframe.- es una tabla compuesta de uno o m�s vectores de la misma longitud, pero con elementos que pueden
# ser de diferentes tipos.
iris
fix(iris)

# e) Lista.- una colecci�n de con objetos de diferente tipo (e.g. vectores, arreglos, tablas, otras listas, etc).
# Es la forma como R devuelve los resultados de funciones complejas:
ls()
modelo<-lm(c(6,8,10)~c(2,4,6))
ls(modelo)

# Existen comandos que permiten conocer las caracter�sticas generales de un objeto:
str(vect)  		#Devuelve la estructura un objeto
str(iris) 

dim(matr)  		#Devuelve las dimensiones de una matriz, tabla o arreglo
dim(samp) 
dim(iris)

head(iris)  	#Devuelve las primeras 6 filas de una tabla.
names(iris) 	#Devuelve los nombres de las columnas de una tabla

summary(vect)	#Devuelve el resumen estad�stico de un objeto por columnas, sea esta una o varias.
summary(iris)

# Usar el mismo nombre para dos objetos distintos implica perder la asignaci�n del primer objeto, y no es
# recomendable usar letras comunes en notaci�n estad�stica para nombrar objetos creados por un usuario. Por 
# ejemplo, no uses como nombre la letra "x", "F" o "T").
xx<-4
xx
xx<-"xx ya no es el mismo"
xx

# Para poder convertir un objeto de una clase a otra se usa la funci�n 'as...'. Al llevar a cabo la conversi�n
# se suelen afectar distintos atributos del objeto. Por ejemplo, si quieres convertir un vector de n�meros a un
# factor (o variable categ�rica con niveles a>1):
v.num<-c(1,2,3,4,5); yy<-c(2,4,6,8,10)
plot(y=yy,x=v.num, type="l")
v.fac<-as.factor(v.num)
plot(y=yy,x=v.fac, type="l")


# 4. Operadores en R

# Hay 3 tipos de operadores: aritm�ticos, comparativos y l�gicos. En general no requieren par�ntesis en su sintaxis.
# Los operadores aritm�ticos y comparativos act�an usando dos elementos (x + y, a < b), los l�gicos pueden actuar
# sobre uno o dos elementos. Los operadores aritm�ticos act�an sobre variables de tipo num�rico y l�gico; en este
# �ltimo caso los valores l�gicos son forzados a valores num�ricos. Los operadores comparativos pueden actuar sobre
# cualquier tipo devolviendo uno o varios valores l�gicos.
3+4>5				# "3 mas 4 es mayor que 5"
!TRUE				# "lo contrario de TRUE es..." 
10/5!=12/6			# 10 entre 5 no es igual a 12 entre 6
y.y<=50				# los elementos del objeto "yy" son menores o iguales que 50
2*6==3*4			# "2 por 6 es igual a 3 por 4. Se usan dos signos de igual para diferenciar de la instruccion
					# de "asignar".
					

# 5. Ayuda en R

# El signo de interrogaci�n previo al nombre de la funci�n la busca en todas las librerias de R (da el mismo
# resultado que la funci�n 'help'). Doble signo permite buscar con  palabras que se parezcan a la tuya o que
# aparezcan en textos asociados a R ("fuzzy search"):
?lm
help("*")
??average









 






