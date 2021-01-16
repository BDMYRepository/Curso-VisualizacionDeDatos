# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # RBasica C: Importación y Exportación de Datos
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


# 1. Directorio de trabajo

# Por default R interactúa sólo con el directorio de trabajo "working directory", por lo que guarda y llama solo
# archivos que se encuentren en esa carpeta. Para saber cuál es el directorio de trabajo que R tiene en tu
# computadora puedes usar la función 'getwd'. Para cambiar el directorio de trabajo se usa la funciónn 'setwd'
# seguido de la dirección completa o ruta para llegar a éste en tu computadora. Recuerda poner la ruta entre
# doble comilla (es un texto). Se recomienda utilizar una carpeta que se encuentre cerca del directorio raíz de
# la computadora, para reducir la probabiliad de errores tipográficos.
getwd()

# Al cambiar el directorio de trabajo, nota que en la ruta que escribas, el separador debe ser una diagonal ('/'),
# o bien, puede una doble diagonal invertida ('\\'); pero R no reconoce una única diagonal invertida ('\'), que es
# el separador default en WINDOWS. Los usuarios de Mac deben modificar el inicio del argumento, pues ese sistema
# operativo no usa "C" como directorio raíz.
setwd("C:/MidirectorioR") # establece esta ruta y carpeta para el directorio de trabajo.

# No es obligatorio cambiar de directorio de trabajo, pero si no lo haces, deberás especificar la ruta cada vez que
# necesites que R guarde o llame un archivo de datos.


# 2. Importar datos a partir de archivos en formato de texto (.txt, .csv).

# Para importar archivos txt o csv, se puede usar la función 'read.table' que está en la librería basica. Para ello,
# es necesario indicar el tipo de separador de las columnas que fue utilizado cuando se generó ese archivo de datos.
# Esa información es la que suele ser referida como "separado por tabulador" o "separado por comas" que puede leerse
# en las ventanas de WINDOWS cuando se quiere guardar un archivo excel como archivo de texto. Si quieres importar 
# los datos a partir de un archivo de texto separado por tabulador, espacios o comas, puedes usar lo siguiente: 
read.table(file="prueba.txt", sep="\t", head=T) # separador con tabulador
read.table(file="prueba.txt", sep="\n", head=T) # separador con espacios
read.table(file="prueba.csv", sep=",", head=T)  # separador con comas.

# Otro argumento de esta función es 'head' donde se especifica si la primera fila contiene los encabezados de las
# columnas (TRUE), o no (FALSE). El argumento 'dec' sirve para designar si se usó una coma o un punto para separar
# los decimales. El argumento 'file' sirve para especificar la ruta donde se encuentra el archivo si el directorio
# de trabajo ha sido cambiado.
read.table(file="prueba.txt", sep="\t", head=F)

# Si asignas un nombre al objeto, este queda en la sesión listo para ser llamado o usado de otras maneras (ver
# RBasB_ManipObj.r)  
mitabla<-read.table(file="prueba.csv", sep=",", head=T)
mitabla

# Otra alternativa es usar la función 'read.delim'. Esta no requiere haber cambiado el directorio de trabajo
# porque el argumento 'file.choose' seguido de paréntesis vacíos automáticamente abre una ventana para que
# indiques la carpeta donde se encuentra el archivo de texto. Es importante que antes de usar la función hayas
# cambiado el archivo de datos de formato exel (.xlsx) a archivo de texto delimitado y escogido el separador
# (por tabuladores, coma, espacio, etc.).
read.delim(file.choose(), head=T)


# 3. Importar archivos en formato Exel (.xlsx).

# Para importar archivos de formato Exel se utilizan las funciones de la librería 'xlsx'. Debes haber instalado
# la librería con la función 'install.packages' y haberla llamado con la función 'library'). Si no se quiere
# especificar la ruta de acceso al archivo, este debe estar en el directorio de trabajo. Como exel maneja archivos
# con más de una "hoja", el número de la hoja o su nombre (entre comillas dobles) deberá ser especificado en el
# segundo argumento de la función.
library(xlsx)
mydata <- read.xlsx('prueba.xlsx', 1) 
 

# 4. Exportar una tabla desde R (en archivo de texto o archivo excel)

# Para que subir y que sea grabada una tabla o data-frame en un archivo txt, se usa la función 'write.table' de
# la librería básica. Es necesario indicar el tipo de separadores se usarán entre las columnas, asi como si existen
# encabezados en las columnas y nombres en las filas.
iris
write.table(iris, "myiris.txt", sep="\t", col.names=T, row.names=F)

# Para exportar una tabla en un formato Exel se requiere una función de la librería 'xlsx'. El argumento 'append'
# cuando es falso, indica sustituir con un archivo que pudiera tener el mismo nombre; si verdadero, lo adiciona al
# que ya existía:
write.xlsx(iris, "myiris.xlsx", sheetName="Sheet1", col.names=TRUE, row.names=FALSE, append=FALSE)

# En todos los casos conviene haber definido el directorio de trabajo, ya sea cambiándolo o sabiendo cuál es.


# 5. Exportar gráficos elaborados en R
  
# Los gráficos se pueden grabar a través del menú de R cuando la hoja de gráficos está activa, usando los comandos
# "File>Save as>" y luego escogiendo el formato deseado. Otra forma es usando a función 'savePlot' y seleccionando 
# el tipo de archivo gráfico que se desea usar (hay distintos tipos de archivo gráfico: wmf", "png", "jpg", "jpeg",
# "bmp", "tif", "tiff", "ps", "eps", "pdf"):
plot(iris[,2] ~ iris[,1])
savePlot(filename="Grafico 1", type=c("wmf")) 

# También podemos seleccionar el gráfico con boton del lado derecho copiar y pegar en otro programa (Word, Powerpoint).
