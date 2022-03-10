#!/bin/bash
echo " ================================================================== "
echo " O Shell está instalando o WordPress para você. "
echo " ================================================================== "
# Start - Instalação Docker
#==================================================================
sudo yum update
sudo yum install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo yum update
#==================================================================
sudo apt-cache policy docker-ce
#==================================================================
# Check Status Docker
#==================================================================
sudo systemctl status docker
#==================================================================
# Adicionar o usuario ao Grupo Docker
#==================================================================
sudo usermod -aG docker ec2-user
#==================================================================
# Informações docker
#==================================================================
docker info
#==================================================================
# Instalação do Docker Compose 
#==================================================================
sudo curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker- compor
#==================================================================
# Definição de permissões
#==================================================================
sudo chmod +x /usr/local/bin/docker-compose
#==================================================================
# Testando o docker-compose
#==================================================================
docker-compose --version
#==================================================================
# Instalação Wordpress / Nginx
#==================================================================
sudo mkdir wordpress-docker
cd wordpress-docker
sudo mkdir nginx
sudo mkdir wordpress
sudo mkdir -p logs/nginx
#==================================================================
# Configuração Ngix
#==================================================================
curl -sSL  https://raw.githubusercontent.com/pietromleite/docker-compose/main/wordpress.conf > wordpress.conf
#==================================================================
# Configuração Docker-Compose
#==================================================================
curl -sSL https://raw.githubusercontent.com/pietromleite/docker-compose/main/docker-compose.yml > docker-compose.yml
#==================================================================
# Executando Docker-Compose
#==================================================================
cd ~/wordpress-docker
docker-compose up -d
#==================================================================
# Status 
#==================================================================
docker ps -a
echo " ===================================================== "
echo "Opa, deu tudo certo! Acesse seudomínio.com.br/wp-admin via navegador"
echo " para finalizar a instalação =D "
echo " ===================================================== "

