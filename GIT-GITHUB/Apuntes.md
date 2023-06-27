# Contenido

## Parte I : Git

[Parte I](#parte-i)

1. [CONFIGURACIONES INICIALES GIT](#configuraciones-iniciales-git)
1. [Configuración de usuario](#configuración-de-usuario)
1. [Crear un repositorio local](#crear-un-repositorio-local)
1. [Configurar una rama por defecto](#configurar-una-rama-por-defecto)
1. [Eliminar un repositorio local](#eliminar-un-repositorio-local)
1. [TRES AREAS EN GIT](#tres-areas-en-git)
   - [Directorio de trabajo](#directorio-de-trabajo)
   - [Area de preparación (_STAGING AREA_)](#area-de-preparación-staging-area)
   - [Repositorio (directorio .git)](#repositorio-directorio-git)
   - [Estados para una versión concreta](#estados-para-una-versión-concreta)
1. [COMMIT](#datos-del-commit)
   - [Datos del commit](#crear-un-commit)
   - [Lanzar desde Git VS-code para crear un commit ](#lanzar-desde-git-vs-code-para-crear-un-commit)
   - [Ver el historial de los commit que se han realizado](#ver-el-historial-de-los-commit-que-se-han-realizado)
1. [ASOCIAR EDITOR DE TEXTO PARA LOS COMMIT](#asociar-editor-de-texto-para-los-commit)
1. [MODIFICAR UN COMMIT](#modificar-un-commit)
1. [RAMAS (_BRANCHES_)](#ramas-branches)

   - [Crear una rama en gitbash](#crear-una-rama-en-gitbash)
   - [Ver ramas](#ver-ramas)
   - [Cambiar de ramas](#cambiar-de-rama)
   - [Crear una rama y cambiar a ella en un solo paso](#crear-una-rama-y-cambiar-a-ella-en-un-solo-paso)
   - [Cambiar el nombre de una rama](#cambiar-el-nombre-de-una-rama)

   - [Eliminar una rama en el repositorio local de git](#eliminar-una-rama-en-el-repositorio-local-de-git)
   - [Crear commit en una rama](#crear-commit-en-una-rama)
   - [Mostrar los commits en una sola linea](#mostrar-los-commits-en-una-sola-linea)
   - [Fusionar ramas en git](#fusionar-ramas-en-git)
   - [Conflictos al fusionar ramas](#conflictos-al-fusionar-ramas)

## Parte II : Apectos clave de GitHub

1. [Parte II : Aspectos clave de GitHub](#parte-ii--aspectos-clave-de-github)
1. [Asignar un correo en GitHub](#asignar-un-correo-en-github)
1. [FETCH](#fetch)
1. [Bifurcar un repositorio (FORK)](#bifurcar-un-repositorio-fork)
1. [Pull requests (Contribuir)](#pull-requests-contribuir)
1. [Pull requests a partir de una rama](#pull-requests-a-partir-de-una-rama)
1. [Issues (Lista tareas pendientes)](#issues-lista-tareas-pendientes)

---

<br>
<br>
<br>

# Parte I

## CONFIGURACIONES INICIALES GIT

## Configuración de usuario

**user name**

> `git config --global user.name "jonvzcas002"`

_Para verificar el usuario_

> `git config user.name`

> ![👀]
>
> **E-mail**
> Se recomienda no usar un correo personal

<!-- jonvzcas
castle
30-05-2000
castlejonvzcas@gmail.com
Garfiel1450 -->
<!-- _Dar de baja esta cuenta si no es necesario más adelante_ -->

> `git config --global user.mail "correo@prueba.com"`

## Crear un repositorio local

> `git init`

## Configurar una rama por defecto

> `git config --global init.defaulBranch main`

## Eliminar un repositorio local

Ingresar al directorio donde se encuentra '**.git**'

> `rm --r git`

[☝](#contenido)

---

# TRES AREAS EN GIT

## Directorio de trabajo

Contiene todos los archivos y el directorio '**.git**'

## Area de preparación (_STAGING AREA_)

También llamada área intermedia. Es donde estan el conjunto de archivos y cambios que serán incluidos en el próximo commit. _NO ES DEFINITIVO._ hasta que se haga un commit.

## Repositorio (directorio .git)

Es el área donde se incluyen los cambios.

## Estados para una versión concreta

| Área                            | Estado     | En ingles |
| ------------------------------- | ---------- | --------- |
| Directorio de trabajo           | Modificada | Modified  |
| Área de preparación             | Preparada  | Staged    |
| Repositorio (_directorio .git_) | Confirmada | Committed |

**Modified**

Si la versión del archivo contiene cambios que **no** son parte del repositorio y no se ha añadido al area de preparación.

**Staged**

Si la versión del archivo contiene cambios que **no** son parte del repositorio pero fue añadida al área de preparación.

**Committed**

Si laversión del archivo ya se encuentra en el directorio de **.git**

[☝](#contenido)

---

## Ver el estado del repositorio

> `git status`

## Añadir un archivo al registro del directorio .git

> `git add nombre-archivo`

**Todos los archivos**

Si lo que se quiere es agregar al staged area todos los archivos que estan actualmente sin seguimiento entonces se escribe:

> `git add .`

## Remover un archivo del área de preparación

> `git rm --cached nombre-archivo`

[☝](#contenido)

---

## COMMIT

### Datos del commit

Un commit se identifica con un SHA (_**S**ecure **H**ash **A**lgorithm_). [Las funciones SHA permiten la creación de cadenas diferentes que facilitan seguir un registro de cambios en la seguridad de diferentes archivos conocida como huella digital](https://es.wikipedia.org/wiki/Secure_Hash_Algorithm)

**Ejemplo:**

> `ad65caeb95f01747ff373b3f08cc71b505f70b14`

El cual contiene los siguientes datos:

- Date
- Author
- Email

### Crear un commit

> `git commit -m "escribir-commit"`

### Lanzar desde Git VS-code para crear un commit

> `git commit`

Entonces se abre un archivo en el editor VS-code para escribir el commit, luego de guardar los cambios y cerrar el archivo de commit.

Luego comprobar en **git** el estado del repositorio con `git status`

### Ver el historial de los commit que se han realizado

> `git log`

[☝](#contenido)

---

# ASOCIAR EDITOR DE TEXTO PARA LOS COMMIT

[Clic aquí para ir a la documentación](https://docs.github.com/es/get-started/getting-started-with-git/associating-text-editors-with-git)

- Asociar **VS-code** como editor en **git**

> `git config --global core.editor "code --wait"`

el `wait` permite que terminemos de escribir el commit, guardemos y cerremos el archivo antes de seguir con el proceso.

---

- Asociar **Sublime Text** como editor en **git**

> `$ git config --global core.editor "'C:/Program Files (x86)/sublime text 3/subl.exe' -w"`

---

- Asociar **Notepad++** como editor en **git**

> `$ git config --global core.editor "'C:/Program Files (x86)/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"`

[☝](#contenido)

---

## MODIFICAR EL ÚLTIMO UN COMMIT

> ![👀]
>
> ## Hacer esto solo de forma local, ya que las consecuencias pueden ser graves si se modifica el commit remoto de otro miembro del equipo.

`git commit --amend`

Se abré automaticamente el editor con el archivo de commit, procedemos a cambiar el mensaje que contiene el commit, guardamos, cerramos y verificamos el commit con `git log`

[☝](#contenido)

---

# REVERTIR UN COMMIT (_COMMIT NUEVO_)

No se modifica el contenido el archivo y se hace con el objetivo de incluir cambios que no se guardaron en el repositorio con el commit anterior.

_Especificamos que queremos retroceder un commit en el historial de commits (HEAD~1)_

> `git reset --soft HEAD~1`

> **--soft**  
> Mantiene cambios en el archivo
>
> **--hard**  
> No conserva cambio en el archivo

Ahora si verificamos el estado de **git**

![reset-commit](/Image/reset-commit.png)

notamos que hay cambios para ser agregados al commit y otros que no han sido agregados al área de preparación.

**_Combinar cambios_**

Para lograr que todos los cambios hagan parte del área de preparación y agregarlos al próximo commit:

> `git add .`

![git-add](/Image/git-add.png)

[☝](#contenido)

---

## RAMAS (_BRANCHES_)

Es una linea independiente de desarrollo en el repositorio.

## Crear una rama en gitbash

> `git branch nombre-rama`

## Ver ramas

> `git branch`

![git-add](/Image/git-branch.png)

## Cambiar de rama

> `git checkut rama-destino`

**_Ejemplo :_**

> `git checkut version-javascript`

![git-add](/Image/git-checkout.png)

## Crear una rama y cambiar a ella en un solo paso

> [!👀]
>
> Tener en cuenta ubicarnos en la rama main para crear una nueva rama a partir de ella.

> `git checkout -b nombre-nueva-rama`

![git-add](/Image/git-checkout-b.png)

## Cambiar el nombre de una rama

> `git checkout -m nuevo-nombre`

![git-add](/Image/git-branch-m.png)

**Otro método :**

> `git branch -m nombre-actual nuevo-nombre`

> [!👀]
>
> No es necesario estar en la misma rama

![git-add](/Image/git-branch-m1.png)

## Eliminar una rama en el repositorio local de git

> `git branch -d rama-a-eliminar`

![git-add](/Image/git-branch-d.png)

> [!👀]
>
> La operación se realiza desde otra rama

## Crear commit en una rama

- Pasarnos a la rama en la que vamos a trabajar `git checkout name-branch`
- Efectuar los cambios en el archivo
- Añadir el archivo al staged área `git add .` ó `git add name-file`
- Hacer el commit `git commit`
- Guardar los cambios, cerrar
- Cambiar de rama y verificar que el cambio solo se hizo en una de las ramas

## Mostrar los commits en una sola linea

> `git log --oneline`

**Otra manera de presentar los commit**

Una manera más informativa de presentar el log de cambios en los archivos es escribiendo:

> `git log -p`

![git-add](/Image/git-log-p.png)

## Fusionar ramas en git

> [!👀]
>
> Para fusionar dos ramas debes estar en la rama que recibirá la fusión.

Luego se ejecuta la siguiente instrucción:

`git merge name-branch`

## Conflictos al fusionar ramas

Los conflictos ocurren cuando se tratan de combinar archivos que tienen cambios que estan en conflicto (_misma linea, mismo texto, mismo elemento_). **Hay que decidir como se van a combinar.**

**_Ejemplo :_**

The same file in both branches

![git-add](/Image/branch-version-js.png)

<br>

![git-add](/Image/branch-main.png)

Ahora pongamos atención en la primera linea.

Trataremos de combinar la rama **version-js** con la rama **main**

Pasamos a la rama que recibirá el cambio.

> `git checkout main`

Procedemos a crear la fusión.

> `git merge version-js`

⚠ Pero resulta este error. Un conflicto con el contenido del archivo.

![git-add](/Image/conflict.png)

Se puede resolver de varias maneras a través del editor de conflictos en VS-code

![git-add](/Image/editor-conflicts.png)

Verificamos el estado de git y vemos que el cambio esta listo para ser agregado.

> `git status`

![git-add](/Image/merging.png)

Continuar con el proceso de **merge**

> `git merge --continue`

Y se despliega el editor para crear el commit del merge

![git-add](/Image/editor-merge.png)

Guardar, cerrar y verificar el cambio.

[☝](#contenido)

---

# Parte II : Aspectos clave de GitHub

## Asignar un correo en GitHub

Esto se hace para no comprometer el correo personal en las contribuciones y las operaciones realizadas en Git.

**Pasos :**

- En **Settings** ingresar al apartador **Emails**
- Copiar el correo asignado en **GitHub** e ir a la terminal de **Git**
  ![correo-git](/Image/correo-git.png)
- Configurar el user.email en la terminal: git `config --global user.email 159988000+ejemplo@users.noreply.github.com`

[☝](#contenido)

---

# FETCH

## Fetch (rastrear cambios remotos sin combinar cambios)

> `git fetch origin`

## Ver los cambios antes de combinarlos

Lo hacemos cambiando de la rama local a la rama remota

> `git checkout origin/main`

Ahora para volver a la rama local

> `git checkout main`

Es momento de combinar lo cambios con la rama main

> `git pull origin main`

[☝](#contenido)

---

# Crear un repositorio local y enviarlo a GitHub

1. Crear el directorio

1. Inicializarlo `git init`

1. Añadir archivos y crear un commit

1. En GitHub creamos un repositorio sin un archivo README.md

1. En Git bash añadir la URL del repositorio remoto que va a sincronizarse con el repositorio local previamente inicializado `git remote add origin https://github.com/jonvzcas1/project-js.git`

1. Verificar el repositorio remoto `git remote -v`

1. Hacer el push del repositorio local al remoto `git push origin main`

[☝](#contenido)

---

# Bifurcar un repositorio (FORK)

Crea una copia del repositorio remoto en tu cuenta de GitHub

# Pull requests (Contribuir)

> [!👀]
>
> Antes de crear un pull requests se debe crear un [isuue](#issues-lista-tareas-pendientes). Informarle al dueño del repositorio que es lo que vamos a hacer para saber si lo aprueba o no.

Solicitud de combinar tus cambios con el repositorio original del proyecto.

Despues de públicar un cambio en el repositorio bifurcado.

Se puede abrir un pull request, o un borrador del mismo para enviar más adelante.

![pull-reques](/Image/pull-requests.png)

# Pull requests a partir de una rama

Se crea una rama nueva en git bash.

> `git branch -b rama-nueva`

Se realizan los cambios y se envian al repositorio forkeado.

Luego se abre un pull requests y se procede a hacer la comparación para verificar que no haya conflicto entre ramas.

# Issues (Lista tareas pendientes)

Permiten registrar, tareas, asuntos o aspectos del repositorio. Permiten asignar tareas a miembros del equipo, especificar etiquetas al issue, y recibir notificaciones. Los issues se pueden editar, cerrar, borrar. Los issue se identifican a través de un número (_o caso_).

![issue](/Image/issue.png)

[☝](#contenido)

---

# Eliminar una rama remota desde gitbash

1. Se sincronizan actualizaciones del repositorio remoto y especificamente de la rama:

> `git pull origin remote-branch`

'remote-branch' _es un nombre asignado para la rama remota de este ejemplo._

1. Verificar la existencia de la rama en el repositorio local.

> git branch

2. Nos ubicamos desde otra rama que no sea la que se va a eliminar.

3. Se elimina la rama local (_por ejemplo la rama 'remote-branch'_)

> `git branch -d remote-branch`

4. Verificamos nuevamente las ramas

> `git branch`

5. Verificamos las ramas remotas que estan en el repositorio

> `git branch -a`

![remote-branches](/Image/remote-branches.png)

6. Eliminamos la rama remote así:

> `git push origin -d remote-branch`

![delete-remote-branch](/Image/delete-remote-branch.png)

_Listo parcero!_

[☝](#contenido)

---
