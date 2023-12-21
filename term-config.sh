#!/bin/bash

# Función para instalar un paquete si no está instalado
install_if_not_exists() {
    if ! command -v $1 &> /dev/null
    then
        echo "Instalando $1..."
        sudo pacman -S --noconfirm $1
    else
        echo "$1 ya está instalado."
    fi
}

# Instalar Alacritty, Fish y Zellij
install_if_not_exists alacritty
install_if_not_exists fish
install_if_not_exists zellij
install_if_not_exists fastfetch
install_if_not_exists starship

# Crear directorios de configuración
echo "Creando directorios de configuración..."
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/fish
mkdir -p ~/.config/zellij

# Configurar temas de Alacritty
echo "Clonando temas de Alacritty..."
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

# Copiar archivos de configuración
echo "Copiando archivos de configuración..."
cp alacritty.toml ~/.config/alacritty/alacritty.toml
cp config.fish ~/.config/fish/config.fish

echo "Configuración completada."

