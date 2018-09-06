#!/bin/sh

##Author: jpclouduk
##Rev: 1.4
##Date: 06/09/2018


contin() {
read -p "Do you want to exit? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    exit 0
fi
}

# Update yum repos
sudo yum clean all
sudo yum -y install epel-release
sudo yum -y update
contin

# Install java and check
sudo yum install java -y
java -version
contin

# Install Scala
wget http://www.scala-lang.org/files/archive/scala-2.10.1.tgz
sudo tar xf scala-2.10.1.tgz -C /usr/lib/
sudo ln -s /usr/lib/scala-2.10.1 /usr/lib/scala
export PATH=$PATH:/usr/lib/scala/bin
contin

# Install Spark
wget http://www-eu.apache.org/dist/spark/spark-2.3.1/spark-2.3.1-bin-hadoop2.7.tgz
tar xzf spark-2.3.1-bin-hadoop2.7.tgz -C $HOME/
export SPARK_HOME=$HOME/spark-2.3.1-bin-hadoop2.7
export PATH=$PATH:$SPARK_HOME/bin
contin

# Update global env variables
sudo sh -c 'printf "\nexport PATH=$PATH:/usr/lib/scala/bin \nexport SPARK_HOME=$HOME/spark-2.3.1-bin-hadoop2.7 \nexport PATH=$PATH:$SPARK_HOME/bin" >> /etc/profile'
contin

# Update firewall
sudo firewall-cmd --permanent --zone=public --add-port=6066/tcp
sudo firewall-cmd --permanent --zone=public --add-port=7077/tcp
sudo firewall-cmd --permanent --zone=public --add-port=8080-8081/tcp
sudo firewall-cmd --reload
contin
