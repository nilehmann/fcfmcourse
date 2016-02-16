Clase LaTeX para la estandarización de ayudantías en la Facultad de Ciencias Físicas y Matemáticas de la Universidad de Chile.

# Archivos

* fcfmcourse.cls: Archivo que implementa el template.
* logos/: Logos de los distintos departamentos.
* Auxiliar1.tex: Archivo de ejemplo.
* teoria.sty: Archivo de ayuda para el ejemplo.


# Uso
Para usar descargar el archivo `fcfmcourse.cls` y el directorio `logos/`. En el archivo latex simplemente usar `fcfmcourse` como la clase del documento.
```latex
\documentclass{fcfmcourse}
```
## Opciones
La clase acepta alguna de las siguientes opciones para especificar el departamento: `das, dcc, dfi, dgf, dic, die, dii, dimec, dim, diqbt, fcfm, geo, minas`. La opción por defecto es `fcfm`.
Adicionalmente la clase acepta las siguientes opciones.
* `usedate`: Activa la opción para desplegar la fecha debajo de la lista de auxiliares.
* `sol`: Activa la opción para mostrar las soluciones.

## Comandos
La clase provee los siguientes comandos.
* `\course[<codigo>]{<nombre>}`: Configura el nombre del curso. Opcionalmente puede proveerse el código del curso.
* `\professor[<correo>]{<nombre>}`: Agrega un profesor. Este comando puede ser llamado multiples veces para agregar más de un profesor. Los profesores se mostrarán en una lista hacia abajo.
* `\assistant[<correo>]{<nombre>}`: Agrega un profesor auxiliar. Al igual que el comando `\professor` también puede ser llamado multiples veces.
* `\title[<num>]{<titulo>}`: El comando `\title` está modificado para aceptar opcionalmente el número de la auxiliar.

## Ambientes
La clase provee los siguientes ambientes.
* `\begin{problems}...\end{problems}`: Ambiente para desplegar la lista de problemas. Dentro de este ambiente puede usarse el comando `\problem` para separar los problemas.
* `\begin{solution}...\end{solution}`: Ambiente para escribir soluciones a los problemas. Las soluciones solo son mostradas en el pdf si la opción `sol` es provista.


# Archivo de ejemplo
Se provee un archivo de ejemplo para ver el uso de la clase. Para compilar el archivo con la opción `sol`, utilizar `latex` o `xelatex`. Las soluciones utilizan el paquete `vaucanson-g` y por lo tanto `pdflatex` no funcionará.
