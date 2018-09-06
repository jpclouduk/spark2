# spark2
Description:
After creating a fresh minimal centos7 install

#Add local user to /etc/sudoers
<youruser>   ALL=(ALL)       ALL

#Update OS
sudo yum update -y
sudo yum upgrade -y
sudo yum install git -y

#Clone Spark2 project
mkdir projects ; cd projects
git clone https://github.com/jpclouduk/spark2.git
cd spark2
