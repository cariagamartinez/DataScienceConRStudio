# Para leer XML es necesario instalar el paquete XML

# Vamos a crear variable para guardar el fichero XML

url = ("../../data/tema1/cd_catalog.xml")

#Primero vamos a crear un documento en xml 
xmldoc <- xmlParse(url) #Crea un apuntador desde la variable url que se guarda en xmldoc

rootnode <- xmlRoot(xmldoc) # Vamos a crear una raíz para que se pueda leer todo el archivo xmldoc y esos datos se guardan en 
                            # la variable rootnode porque xmlRoot accede a la raíz del XML y lo guarda en rootnode

rootnode[2] # Nos va a dar el segundo valor empezando en la raíz

# Luego vamos a crear una matriz que guardaremos en la variable cds_data. La matriz se genera con la función smlSApply
# esta función requiere el nodo raiz e indicar que le aplicaremos una función con parámetro (x) que es cada elemento del nodo raíz
# y luego la función en sí (que es xmlSApply que a cada valor x, le obtiene el valor con la función xmlValue)
# Una vez ejecutado tendremos un nuevo dataframe creado.

cds_data <- xmlSApply(rootnode, function(x) xmlSApply(x, xmlValue) ) #xmlSAoply recorre todos los nodos hijos y extrae los xmlValues

# El resultado es una matriz / tabla que requiere transposición, es decir, la función "t". 

# Con la matriz generada no podemos trabajar sino que tenemos que transformarla a dataframe.
# Vamos a generar el dataframe definitivo con la función data.frame y usaremos la función t sobre la variable cds_data
# para que se genere una tabla traspuesta y sin nombres de filas

cds.catalog <- data.frame(t(cds_data), row.names = NULL) # Como indicamos que las filas no tengan nombre, entonces R las nombrará con números.
head (cds.catalog, 2) # Me enseñará la dos primeras líneas del dataframe.
cds.catalog[1:5,] # Me enseñará las 5 primeras filas (1:5) y todas las columnas (,).





population_url <- "../../data/tema1/WorldPopulation-wiki.htm" # Vamos a importar un documento html para extraer info
tables <- readHTMLTable(population_url) # Una forma sencilla es usar la función readHTMLTable que leerá todas las tablas 
                                        # en el documento y las guardará en la variable tables.
                                        # en este caso, el documento html tiene 28 tablas

most_populated <- tables[[6]] # En este caso es una lista de listas y la tabla está en la posición 6 de las 28. Por eso va entre corchetes.
head(most_populated, 3) # Nos devuelve las tres primeras líneas

custom_table <- readHTMLTable(population_url, which = 6) # Si sabemos la tabla que nos interesa, 
                                                          # directamente la extraemos con la función which.


library(XML)
Proyectos_covid <- "../../../../../../Desktop/Proyectos de investigación financiados COVID-19.html"
datos = readHTMLTable(Proyectos_covid , header = TRUE) # Con header= TRUE consigo que la lectura me ponga los títulos en la primera fila. En caso contrario los llena con V1, V2, etc.
covid_tabla <- datos[[1]]



