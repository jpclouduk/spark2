#!/bin/sh

##Author: jpclouduk
##Rev: 1.2
##Date: 04/08/2018
 

# Update yum repos
yum clean all
yum -y install epel-release
yum -y update

# Install java and check
yum install java -y
java -version

# Install Scala
wget http://www.scala-lang.org/files/archive/scala-2.10.1.tgz
tar xvf scala-2.10.1.tgz
sudo mv scala-2.10.1 /usr/lib
sudo ln -s /usr/lib/scala-2.10.1 /usr/lib/scala
export PATH=$PATH:/usr/lib/scala/bin
scala -version

# Install Spark
wget http://www-eu.apache.org/dist/spark/spark-2.3.1/spark-2.3.1-bin-hadoop2.7.tgz
tar -xzf spark-2.2.1-bin-hadoop2.7.tgz
export SPARK_HOME=$HOME/spark-2.2.1-bin-hadoop2.7
export PATH=$PATH:$SPARK_HOME/bin

# Update global env variables
echo 'export PATH=$PATH:/usr/lib/scala/bin' >> .bash_profile
echo 'export SPARK_HOME=$HOME/spark-1.6.0-bin-hadoop2.6' >> .bash_profile
echo 'export PATH=$PATH:$SPARK_HOME/bin' >> .bash_profile

# Update firewall
firewall-cmd --permanent --zone=public --add-port=6066/tcp
firewall-cmd --permanent --zone=public --add-port=7077/tcp
firewall-cmd --permanent --zone=public --add-port=8080-8081/tcp
firewall-cmd --reload


