# Vagrant box: Ubuntu 16.04 + ElasticSearch + MongoDB
Vagrant box configuration to quickly spin off Ubuntu 16.04, ElasticSearch and MongoDB.

## Setup
1. Install Vagrant.
2. Install VirtualBox.
3. Clone this repository and go to its folder in command line.
4. Run ``vagrant up`` to download the box and provision it (aka install everything).
5. Run ``vagrant ssh`` to enter the box.

The box also has ``htop``, ``mc`` and Oracle Java 8.
Ports ``9200`` and ``27017`` are mapped to the same ports on the host.