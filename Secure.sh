sudo apt update
#https://www.cyberciti.biz/faq/create-a-user-account-on-ubuntu-linux/
sudo useradd -s /bin/bash -d /home/kachaya/ -m -G sudo kachaya
sudo passwd kachaya
sudo userdel -r ubuntu
sed -i "s/#Port 22/Port 168/gi" /etc/ssh/sshd_config
sudo ufw default allow outgoing
sudo ufw default deny incoming
sudo ufw allow 168/tcp
sudo ufw enable -y
