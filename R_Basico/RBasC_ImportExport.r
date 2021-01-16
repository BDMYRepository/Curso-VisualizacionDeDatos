# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # RBasica C: Importaci�n y Exportaci�n de Datos
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


# 1. Directorio de trabajo

# Por default R interact�a s�lo con el directorio de trabajo "working directory", por lo que guarda y llama solo
# archivos que se encuentren en esa carpeta. Para saber cu�l es el directorio de trabajo que R tiene en tu
# computadora puedes usar la funci�n 'getwd'. Para cambiar el directorio de trabajo se usa la funci�nn 'setwd'
# seguido de la direcci�n completa o ruta para llegar a �ste en tu computadora. Recuerda poner la ruta entre
# doble comilla (es un texto). Se recomienda utilizar una carpeta que se encuentre cerca del directorio ra�z de
# la computadora, para reducir la probabiliad de errores tipogr�ficos.
getwd()

# Al cambiar el directorio de trabajo, nota que en la ruta que escribas, el separador debe ser una diagonal ('/'),
# o bien, puede una doble diagonal invertida ('\\'); pero R no reconoce una �nica diagonal invertida ('\'), que es
# el separador default en WINDOWS. Los usuarios de Mac deben modificar el inicio del argumento, pues ese sistema
# operativo no usa "C" como directorio ra�z.
setwd("C:/MidirectorioR") # establece esta ruta y carpeta para el directorio de trabajo.

# No es obligatorio cambiar de directorio de trabajo, pero si no lo haces, deber�s especificar la ruta cada vez que
# necesites que R guarde o llame un archivo de datos.


# 2. Importar datos a partir de archivos en formato de texto (.txt, .csv).

# Para importar archivos txt o csv, se puede usar la funci�n 'read.table' que est� en la librer�a basica. Para ello,
# es necesario indicar el tipo de separador de las columnas que fue utilizado cuando se gener� ese archivo de datos.
# Esa informaci�n es la que suele ser referida como "separado por tabulador" o "separado por comas" que puede leerse
# en las ventanas de WINDOWS cuando se quiere guardar un archivo excel como archivo de texto. Si quieres importar 
# los datos a partir de un archivo de texto separado por tabulador, espacios o comas, puedes usar lo siguiente: 
read.table(file="prueba.txt", sep="\t", head=T) # separador con tabulador
read.table(file="prueba.txt", sep="\n", head=T) # separador con espacios
read.table(file="prueba.csv", sep=",", head=T)  # separador con comas.

# Otro argumento de esta funci�n es 'head' donde se especifica si la primera fila contiene los encabezados de las
# columnas (TRUE), o no (FALSE). El argumento 'dec' sirve para designar si se us� una coma o un punto para separar
# los decimales. El argumento 'file' sirve para especificar la ruta donde se encuentra el archivo si el directorio
# de trabajo ha sido cambiado.
read.table(file="prueba.txt", sep="\t", head=F)

# Si asignas un nombre al objeto, este queda en la sesi�n listo para ser llamado o usado de otras maneras (ver
# RBasB_ManipObj.r)  
mitabla<-read.table(file="prueba.csv", sep=",", head=T)
mitabla

# Otra alternativa es usar la funci�n 'read.delim'. Esta no requiere haber cambiado el directorio de trabajo
# porque el argumento 'file.choose' seguido de par�ntesis vac�os autom�ticamente abre una ventana para que
# indiques la carpeta donde se encuentra el archivo de texto. Es importante que antes de usar la funci�n hayas
# cambiado el archivo de datos de formato exel (.xlsx) a archivo de texto delimitado y escogido el separador
# (por tabuladores, coma, espacio, etc.).
read.delim(file.choose(), head=T)


# 3. Importar archivos en formato Exel (.xlsx).

# Para importar archivos de formato Exel se utilizan las funciones de la librer�a 'xlsx'. Debes haber instalado
# la librer�a con la funci�n 'install.packages' y haberla llamado con la funci�n 'library'). Si no se quiere
# especificar la ruta de acceso al archivo, este debe estar en el directorio de trabajo. Como exel maneja archivos
# con m�s de una "hoja", el n�mero de la hoja o su nombre (entre comillas dobles) deber� ser especificado en el
# segundo argumento de la funci�n.
library(xlsx)
mydata <- read.xlsx('prueba.xlsx', 1) 
 

# 4. Exportar una tabla desde R (en archivo de texto o archivo excel)

# Para que subir y que sea grabada una tabla o data-frame en un archivo txt, se usa la funci�n 'write.table' de
# la librer�a b�sica. Es necesario indicar el tipo de separadores se usar�n entre las columnas, asi como si existen
# encabezados en las columnas y nombres en las filas.
iris
write.table(iris, "myiris.txt", sep="\t", col.names=T, row.names=F)

# Para exportar una tabla en un formato Exel se requiere una funci�n de la librer�a 'xlsx'. El argumento 'append'
# cuando es falso, indica sustituir con un archivo que pudiera tener el mismo nombre; si verdadero, lo adiciona al
# que ya exist�a:
write.xlsx(iris, "myiris.xlsx", sheetName="Sheet1", col.names=TRUE, row.names=FALSE, append=FALSE)

# En todos los casos conviene haber definido el directorio de trabajo, ya sea cambi�ndolo o sabiendo cu�l es.


# 5. Exportar gr�ficos elaborados en R
  
# Los gr�ficos se pueden grabar a trav�s del men� de R cuando la hoja de gr�ficos est� activa, usando los comandos
# "File>Save as>" y luego escogiendo el formato deseado. Otra forma es usando a funci�n 'savePlot' y seleccionando 
# el tipo de archivo gr�fico que se desea usar (hay distintos tipos de archivo gr�fico: wmf", "png", "jpg", "jpeg",
# "bmp", "tif", "tiff", "ps", "eps", "pdf"):
plot(iris[,2] ~ iris[,1])
savePlot(filename="Grafico 1", type=c("wmf")) 

# Tambi�n podemos seleccionar el gr�fico con boton del lado derecho copiar y pegar en otro programa (Word, Powerpoint).
