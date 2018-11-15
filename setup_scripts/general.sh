#!/bin/bash
set -x

#
# update Ubuntu's repository
#
sudo apt-get -y update

#
# setup nmap
#
sudo apt-get -y install nmap

#
# open port 9090 and 9999 for all communications
#
sudo ufw allow 9090
sudo ufw allow 9999

#
# setup Anaconda
#
wget https://repo.anaconda.com/archive/Anaconda3-5.3.0-Linux-x86_64.sh
sudo bash -c "bash Anaconda3-5.3.0-Linux-x86_64.sh -b -p /opt/anaconda3"
sudo bash -c "echo 'ANACONDA_HOME=/opt/anaconda3/' >> /etc/profile"
sudo bash -c "echo 'PATH=/opt/anaconda3/bin:$PATH' >> /etc/profile"

# create a user named seed with password dees. 
sudo useradd -m -p \$6\$6Jn2hHR6/\$L6sK648eoSWwloInQpwzqG0a/eE2a1aYqTAN/zkifOkg0D1Cqofkxh7PqXuPxjzDBd8GMynM2Bpji5iTh/5IU. -s /bin/bash seed
#sudo useradd -m -p WchOyJRR.1Qrc -s /bin/bash seed

# add seed to sudo
sudo usermod -a -G sudo seed
echo "%seed ALL = (root) NOPASSWD: /usr/bin/sudo" >> /etc/sudoers.d/99-emulab

# auto-run jupyter when seed logs in
sudo cat "jupyter notebook" >> /users/seed/.bash_profile

# change root passwd
sudo echo -e "seedubuntu\nseedubuntu" | sudo passwd root

# Set up apache
sudo apt-get -y install apache2


  
