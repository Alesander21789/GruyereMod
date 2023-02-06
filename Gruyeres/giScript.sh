#!/bin/bash

# Comprobar si Git está instalado
if ! [ -x "$(command -v git)" ]; then
  # Instalar Git
  sudo apt-get update
  sudo apt-get install git -y
fi

# Acceder a la carpeta dada
cd "$1"

# Inicializar repositorio Git
git init

# Añadir todos los archivos en la carpeta
git add .

# Configurar correo electrónico
echo "Configurando correo electrónico para Git..."
read -p "Introduce tu correo electrónico: " email
git config --global user.email "$email"

# Configurar nombre de usuario
echo "Configurando nombre de usuario para Git..."
read -p "Introduce tu nombre de usuario: " username
git config --global user.name "$username"

# Añadir carpeta segura para Git
echo "Configurando carpeta segura para Git..."
git config --global --add core.safeDirectory "$1"

# Realizar un commit inicial
git commit -m "Inicializado"

# Vincular con repositorio remoto
echo "Vinculando con repositorio remoto..."
read -p "Introduce la URL del repositorio remoto: " remote_url
read -p "Introduce tu nombre de usuario de GitHub: " remote_username
read -p "Introduce tu token de acceso a GitHub: " remote_token

# Añadir credenciales al repositorio remoto
git remote set-url origin "$remote_url"
git remote set-url --push origin "https://$remote_username:$remote_token@github.com/$remote_username/$1.git"
