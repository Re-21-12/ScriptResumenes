#!/bin/bash

# Este script recuperara toda la informacion que he obtenido a traves de los distintos cursos


# Ingresa un nombre para el archivo
read -p "Ingresa un nombre para el archivo: " nombreEntrada
# Le agregamos la extension en .txt
nombre="${nombreEntrada}.txt"
# Inicializamos el archivo
> "$nombre"
: "
Vas a buscar en esta carpeta todo el contenido con la extension .txt
 Luego todo los nombres de archivos que obtengas los vas a guardar en una variable para crear un arreglo de este tipo
 usamos () por que estamos ejecutando un comando
 usamos ($()) para decir que estamos usando un arreglo       
-print0: al finalizar cada cadena ejemplo archivo.txt agregara un '\0' para indicar el final del archivo entonces sera archivo.txt\0
 la siguiente es como un replace recorre  cada uno de los archivos o nombres de estos y sustituye '\0' con un  para indicar que hay un espacio  vacio
 "

archivos=($(find ./ -name "*.txt" -print0))
#cantidad_archivos=$(find . -name "*.txt" -type f | wc -l)
# Leer una línea del archivo "archivo.txt" hasta que se encuentre un carácter nulo
while IFS= read -r -d $'\0' archivo; do
cat "$archivo" >> "$nombre"   
echo "Archivo: $archivo"
#echo "${archivo[@]}"
#echo "${#archivo[@]}"
#echo "La cantidad es: ${archivo[${#archivos[@]}-1]}"
#cat "$archivo" >> "$nombre"
#unset archivos[0]
done < <(find ./ -type f -name "*.txt" -print0)

echo "${#archivos[@]}"
# Usamos "" para mantener seguridad y que se puedan usar caracteres especiales
# > Sobreescribe
# >> agrega
