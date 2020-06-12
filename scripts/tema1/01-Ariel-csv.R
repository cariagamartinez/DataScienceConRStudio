# Vamos a crear una variable para cargar datos, que se llamará coche. Como el directorio de trabajo es BIG DATA, 
# vamos a usar .. para indicar que tenemos que subir un nivel en las carpetas y luego vamos a ir dándole al tabulador
# para llegar al fichero. Le vamos a indicar si el fichero tiene una cabecera, es decir, la primera fila tiene
# el título (header = TRUE). Luego indicaremos el separador, que generalmente es una coma.
# Luego hacemos name de la variable para saber que toda la información está correctamente guardada en la variable.

coche = read.csv("../../data/tema1/auto-mpg.csv", header = TRUE, sep = "," ,
                 #strings.na = " ", #Si viene N/A entonces los podemos poner entre comillas 
                 stringsAsFactors = FALSE)

names (coche)

who_from_internet <- read.csv("https://frogames.es/course-contents/r/intro/tema1/WHO.csv")
