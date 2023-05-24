# Contenido

1. [ARCHIVOS](#archivos)
   - [Listamiento de archivos y carpetas](#listamiento-de-archivos-y-carpetas)
   - [Combinaciones y variaciones](#combinaciones-y-variaciones)
   - [Mostrar donde estoy parado](#combinaciones-y-variaciones)
   - [Ordenar archivos](#ordenar-archivos)
1. [ACCESO ADMINISTRATIVO](#acceso-administrativo)
   - [Especificar el inicio de sesión en la shell como root](#especificar-el-inicio-de-sesión-en-la-shell-como-root)
   - [SUDO](#sudo)
1. [PERMISOS DE LOS ARCHIVOS](#permisos-de-los-archivos)
   - [Conjunto de Permisos](#conjunto-de-permisos)
   - [Acción](#acción)
   - [Permisos](#permisos)
   - [TEMA APARTE, NO TAN APARTE](#tema-aparte-no-tan-aparte)
   - [Cambiar el propietario de un archivo](#cambiar-el-propietario-de-un-archivo)
1. [VISUALIZACIÓN DE ARCHIVOS](#visualización-de-archivos)
   - [cat](#cat)
   - [head](#head)
   - [tail](#tail)
1. [COPIAR ARCHIVOS](#copiar-archivos)
1. [CLONAR UN DISCO](#clonar-un-disco)
1. [MOVER ARCHIVOS](#mover-archivos)
   - [Forma de cambiar el nombre a un archivo](#forma-de-cambiar-el-nombre-a-un-archivo)

[☝️](#contenido)

<hr>

# ARCHIVOS

## Listamiento de archivos y carpetas

> `ls -l` _lista archivos y muestra atributos_

> `ls -r` _lista los archivos en orden Z A_

> `ls -l` _Documents lista directamente el contenido de una carpeta_

## Combinaciones y variaciones

> `ls -l -r`

> `ls -rl`

> `ls -lr`

## Mostrar donde estoy parado

> `pwd` _muestra donde estoy parado_

> `cd ..` _retroceder un directorio_

> `cd ~` _directorio principal del usuario_

## Ordenar archivos

> `ls -l -t /ruta-directorio` _ordena archivos por sello de tiempo_

> `ls -l -S /ruta-directorio` _ordena archivos por tamaño_

> `ls -lSr /ruta-directorio` _invierte el orden de cualquier tipo de ordenación_

> `ls -r /ruta-directorio` _invierte los archivos por orden alfabético_

[☝️](#contenido)

<hr>

# ACCESO ADMINISTRATIVO

<!-- La contraseña de práctica es: netlab123 -->

## Especificar el inicio de sesión en la shell como root

> `su -` _inicia sesión como root_

> `su -l` _inicia sesión como root_

> `su --login` _inicia sesión como root_

> `logout` _cierra sesion como root_

> `exit` _vover al usuario previo al root_

## SUDO

Permite ejecutar comandos como otro usuario sin tener que crear un nuevo shell
sudo -u también se utiliza para cambiar a otras cuentas de usuario.

**_Ejemplo:_**

> `sudo sl` _muestra la locomotora en la CLI_

[☝️](#contenido)

<hr>

# PERMISOS DE LOS ARCHIVOS

**Método simbólico**

`chmod [<CONJUNTO DE PERMISOS><ACCIÓN><PERMISOS>]... ARCHIVO`

## Conjunto de Permisos

> `u` _Usuario propietario del archivo_
>
> `g` _Grupo propietario del archivo_
>
> `o` _Otros_
>
> `a` _Todos_

## Acción

> `-` _añadir permiso, si es necesario_
>
> `=` _especificar el permiso exacto_
>
> `*` _eliminar el permiso, si es necesario_

## Permisos

> `r` _leer (read)_
>
> `w` _escribir (write)_
>
> `x` _ejecutar (execute)_

## ... ARCHIVO

Ruta y nombre para los archivos a los que se quiere asignar los permisos.

<hr>

### **_TEMA APARTE, NO TAN APARTE_**

> `./` Esto indica que el “comando” debe ejecutarse desde el directorio actual
>
> `./hello.sh` _ejecutar un script (ejemplo)_

<hr>

**_Ejemplo:_**

Dando permiso de ejecución al usuario actual

`chmod u+x hello.sh`

## Cambiar el propietario de un archivo

Puede ser realizado por el usuario root o el propietario del archivo.

> `chown` _cambia el propietario de los archivos y directorios_

**SINTAXIS de chown**

`chown [PROPIETARIO] ARCHIVO`

El primer argumento especifica al usuario que debe ser el nuevo propietario del archivo.

El segundo argumento especifica a cual archivo se esta cambiando de propietario.

**_Ejemplo:_**

`sudo chown root hello.sh`

[☝️](#contenido)

<hr>

# VISUALIZACIÓN DE ARCHIVOS

## cat

> `cat` _Permite ver el contenido de archivos pequeños_

SINTAXIS de cat:

> `cat [ARCHIVO]`

**_Ejemplo:_**

> `cat animals.txt`

## head

> `head [ARCHIVO]` _Permite visualizar las primeras lineas_ de un archivo

> `head -n 3 [ARCHIVO]` _Especifica la cantidad de lineas a mostrar_

## tail

> `tail [ARCHIVO]` _Permite visualizar las últimas lineas de un archivo_

> `tail -n 3 [ARCHIVO]` _Especifica la cantidad de lineas a mostrar_

[☝️](#contenido)

<hr>

# COPIAR ARCHIVOS

> `cp [OPCIONES] ORIGEN DESTINO` _copiar archivos_

**_Ejemplo:_**

`(.)` El punto significa el directorio actual. En este ejemplo se esta copiando un archivo al directorio actual:

> `cp /etc/passwd .`

> [!NOTE]
>
> A tener en cuenta: Los permisos pueden afectar a los comandos de administración de archivos, como el comando `cp`. Para copiar un archivo, es necesario tener permiso de ejecución para acceder al directorio donde se encuentra el archivo y permiso de lectura para el archivo que se está copiando.

[☝️](#contenido)

<hr>

# CLONAR UN DISCO

> `dd` El comando dd se utiliza para copiar archivos o particiones enteras al nivel de bits.
>
> Se puede usar para copiar datos no procesados (raw) a dispositivos extraíbles como dispositivos USB o CD ROMS.
>
> `dd if=/dev/sda of=/dev/sdb` clonar de un disco duro **(/dev/sda)** a otro **(/dev/sdb)**
>
> | Comando                    | Disco Origen | Disco Destino |
> | -------------------------- | ------------ | ------------- |
> | dd if=/dev/sda of=/dev/sdb | /dev/sda     | /dev/sdb      |

[☝️](#contenido)

<hr>

# MOVER ARCHIVOS

> `mv ORIGEN DESTINO`

**_Ejemplo:_**

> `mv people.csv Work` Moviendo un archivo a un directorio conservando su nombre

**_Ejemplo:_** Moviendo varios archivos a un directorio

> `mv Apuntes-Linux.md Apuntes-Networks.md /home/jonvzcas/Documents` _Moviendo varios archivos a un directorio._
>
> El último argumento es el destino.

## Forma de cambiar el nombre a un archivo

> `mv animals.txt zoo.txt` _Si se mueve dentro del mismo directorio es una forma de cambiarle de nombre_

> [!NOTE]
>
> A tener en cuenta: Los permisos pueden afectar comandos de administración de archivos, incluyendo el comando mv. Mover un archivo requiere tener permisos de escritura y ejecución tanto en los directorios de origen como de destino.

[☝️](#contenido)

<hr>
// - - - - - ELIMINAR ARCHIVOS - - - - -

rm [OPCIONES] ARCHIVO sin ninguna opción el comando se utiliza para eliminar archivos ordinarios. Ejemplo: rm linux.txt
rm -r o -R DIRECTORIO elimina de forma recursiva a todos los subdirectorios y archivos contenidos en el DIRECTORIO

A tener en cuenta: Los permisos pueden afectar a los comandos de administración de archivos, como el comando rm.
Para eliminar un archivo dentro de un directorio, el usuario debe tener permiso de escritura y ejecución en
ese directorio. Normalmente, los usuarios ordinarios solo tienen este tipo de permiso en su directorio principal
y subdirectorios correspondientes.
// - - - - - FILTRADO DE ENTRADAS - - - - -

grep El comando grep es un filtro de texto que busca líneas en una entrada y devolverá aquellas que coincidan con un patrón determinado.
grep [OPCIONES] PATRÓN [ARCHIVO] ejemplo: grep sysadmin passwd

// Expresiones regulares
(caracteres de anclaje) Son una de las formas con que se pueden utilizar expresiones regulares para limitar los resultados de una búsqueda.
Por ejemplo el patrón root aparece muchas veces en el archivo /etc/passwd

grep 'root' passwd el patrón se escribe en comillas solidas para evitar que el shell malinterprete como caracteres especiales

Primer caracter de anclaje ^ se utiliza para indicar que el patrón debe de aparecer al principio de la linea
ejemplo:grep '^root' /etc/passwd output root:x:0:0:root:/root:/bin/bash

caracter de anclaje $ se utiliza para indicar que el patrón debe aparecer al final de la linea.
ejemplo: encontrar las lineas que terminan en r en el archivo alpha-first.txt
grep 'r$' alpha-first.txt output B is for Bear  
 F is for Flower

caracter .(punto) Representa cualquier carácter excepto el carácter de nueva línea.
ejemplo: grep r..f red.txt output reed
read
grep r...f red.txt output reeed
grep '....' red.txt output encuentra cat todas las palabras de al menos cuatro caracteres
[0-9] encuentra todas las líneas en el archivo profile.txt que contienen un número,
utilice el patrón [0123456789] o [0-9]
ejemplo: grep [0-9] profile.txt output I am 37 years old.
3121991
I have 2 dogs.
123456789101112

[^0-9] encuentra líneas con caracteres no numéricos

[.] solo las líneas que contienen el carácter . se mostraran en el resultado
Cuando otros caracteres de expresión regular se colocan dentro de corchetes, se tratan como caracteres
literales. Por ejemplo, el carácter . normalmente indica cualquier carácter. Pero si se coloca dentro de corchetes
simplemente se referirá al carácter . (punto). En el siguiente ejemplo, sólo las líneas que contienen el carácter . se mostrarán en el resultado.
Ejemplo: grep '[.]' profile.txt

Indicar un carácter o
patrón repetido utilizando el _ El carácter de expresión regular _ se utiliza para indicar la ausencia o la presencia una o más veces del carácter o patrón que lo precede.
ejemplo: grep 're\*d' red.txt output red  
 reeed  
 rd  
 reed

    					También es posible indicar la ausencia o presencia una o más veces de una lista de caracteres utilizando los corchetes.
    					ejemplo: grep 'r[oe]*f' red.txt		output 	reef
    											roof

// SEGUIR EN 14.2 Cuando se usa con un solo carácter, \* no resulta muy útil.
