#!/bin/bash

# Atualizar repositórios
sudo apt update && sudo apt upgrade -y

# Instalar dependências
sudo apt install -y software-properties-common apt-transport-https wget curl gnupg

# Adicionar repositório do Google Chrome para atualizações automáticas
echo "Adicionando repositório do Google Chrome..."
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list

# Atualizar repositórios após adicionar o repositório do Google Chrome
sudo apt update

# Instalar Google Chrome a partir do repositório
echo "Instalando Google Chrome a partir do repositório..."
sudo apt install -y google-chrome-stable

# Instalar Arduino IDE
echo "Instalando Arduino IDE..."
sudo snap install arduino

# Instalar Visual Studio Code
echo "Instalando VS Code..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install -y code
rm packages.microsoft.gpg

# Instalar Node.js (LTS)
echo "Instalando Node.js..."
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs

# Finalizando
echo "Instalação concluída com sucesso!"
