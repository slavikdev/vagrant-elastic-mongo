#!/usr/bin/env bash

# Upgrade packages
sudo apt-get update
sudo apt-get upgrade

# Install tools
sudo apt-get install -y mc
sudo apt-get install -y htop

# Install java
sudo apt-get install -y software-properties-common python-software-properties
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update
sudo apt-get install -y oracle-java8-installer
echo "Setting environment variables for Java 8..."
sudo apt-get install -y oracle-java8-set-default

# Install ElasticSearch
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install -y apt-transport-https
echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list
sudo apt-get update && sudo apt-get install -y elasticsearch
sudo update-rc.d elasticsearch defaults 95 10
sudo /bin/systemctl daemon-reload

# Configure ElasticSearch
sudo echo "network.bind_host: 0" >> /etc/elasticsearch/elasticsearch.yml
sudo echo "network.host: 0.0.0.0" >> /etc/elasticsearch/elasticsearch.yml
sudo echo "http.cors.enabled: true" >> /etc/elasticsearch/elasticsearch.yml
sudo echo "http.cors.allow-origin: /https?:\/\/.*/" >> /etc/elasticsearch/elasticsearch.yml

# Start ElasticSearch
sudo /etc/init.d/elasticsearch start

# Install MongoDB
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo apt-get update
sudo apt-get install -y mongodb
