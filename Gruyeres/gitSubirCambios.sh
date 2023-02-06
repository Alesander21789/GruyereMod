#!/bin/bash

Comprobar si estamos en la carpeta del repositorio
if [ ! -d ".git" ]; then
echo "Este script debe ser ejecutado en la carpeta del repositorio local."
exit 1
fi

A�adir todos los cambios en el repositorio local
git add .

Solicitar el mensaje del commit
read -p "Introduce el mensaje de commit: " message

Hacer el commit
git commit -m "$message"

Subir los cambios al repositorio remoto
read -p "Introduce tu contrase�a de GitHub: " -s password
echo "$password" | git push origin master

Este script supone que tienes el repositorio remoto vinculado con el nombre "origin". Si esto no es as�, debes cambiar "origin" a la direcci�n URL del repositorio remoto.