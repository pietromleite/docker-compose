#!/bin/bash
echo " ================================================================== "
echo " O Shell está preparando o WordPress para você. "
echo " ================================================================== "
echo " . "
sleep 1
echo " ...... "
sleep 1
echo " .................. "
sleep 1
echo " ................................... "
sleep 1
echo " ............................................................... "
echo " ================================================================== "
echo " Start - Instalação Docker "
echo " ================================================================== "
sudo yum update
sudo yum install -y docker
sleep 1
echo " ================================================================== "
echo " Iniciando e informações Docker "
echo " ================================================================== "
sudo service docker start
sleep 3
echo " OK "
sleep 1
sudo chmod 666 /var/run/docker.sock
sleep 3
echo " OK "
docker info
sleep 2
echo " ================================================================== "
echo " Adicionar o usuario ao Grupo Docker "
echo " ================================================================== "
sudo usermod -aG docker ec2-user
echo " OK "
echo " ================================================================== "
echo " Instalação do Docker Compose "
echo " ================================================================== "
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
echo " ================================================================== "
echo " Definição de permissões "
echo " ================================================================== "
sudo chmod +x /usr/local/bin/docker-compose
echo " OK "
sleep 1
echo " ================================================================== "
echo " Testando o docker-compose "
echo " ================================================================== "
docker-compose --version
echo " OK "
sleep 2
echo " ================================================================== "
echo " Iniciando instalação (Wordpress / Nginx) "
echo " ================================================================== "
sudo mkdir wordpress-docker
cd wordpress-docker
sudo mkdir nginx
sudo mkdir wordpress
sudo mkdir -p logs/nginx
sleep 1
echo " ================================================================== "
echo " Configurando Ngix "
echo " ================================================================== "
sudo chown ec2-user:ec2-user /home/ec2-user -R
sleep 2
echo " OK "
sudo chown ec2-user:ec2-user /home/ec2-user/wordpress-docker -R
sleep 2
echo " OK "
sudo curl -sSL  https://raw.githubusercontent.com/pietromleite/docker-compose/main/wordpress.conf > nginx/wordpress.conf
echo " OK "
sleep 1
echo " ================================================================== "
echo " Configurando Docker-Compose "
echo " ================================================================== "
sudo curl -sSL https://raw.githubusercontent.com/pietromleite/docker-compose/main/docker-compose.yml > docker-compose.yml
echo " OK "
echo " ================================================================== "
echo " Executando Docker-Compose "
echo " ================================================================== "
cd ~/wordpress-docker
docker-compose up -d
sleep 2
echo " ================================================================== "
echo " Status "
echo " ================================================================== "
docker ps -a
sleep 2
curl http://localhost
sleep 2
echo " =================================================================="
echo "Opa, deu tudo certo! Acesse seudomínio.com.br/wp-admin via navegador"
echo " para finalizar a instalação =D "
echo " =================================================================="
