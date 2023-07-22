sudo apt update
#https://www.cyberciti.biz/faq/create-a-user-account-on-ubuntu-linux/
sudo useradd -s /bin/bash -d /home/kachaya/ -m -G sudo kachaya
sudo passwd kachaya
sudo userdel -r ubuntu
sudo sed -i "s/#Port 22/Port 168/gi" /etc/ssh/sshd_config
#https://askubuntu.com/questions/1439461/ssh-default-port-not-changing-ubuntu-22-10
sudo ufw allow 168/tcp
sudo ufw enable
sudo service ssh restart
# /etc/services
