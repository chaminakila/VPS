sudo apt-get update
#https://www.cyberciti.biz/faq/create-a-user-account-on-ubuntu-linux/
sudo useradd -s /bin/bash -d /home/kachaya/ -m -G sudo kachaya
sudo passwd kachaya
sudo sed -i "s/#Port 22/Port 168/gi" /etc/ssh/sshd_config
#https://unix.stackexchange.com/questions/145299/simple-sed-replacement-of-tabs-mysteriously-failing
sudo sed -i "s/$(printf 'ssh\t\t22')/$(printf 'ssh\t\t168')/gi" /etc/services
#https://askubuntu.com/questions/1439461/ssh-default-port-not-changing-ubuntu-22-10
sudo mkdir -p /etc/systemd/system/ssh.socket.d
echo '[Socket]' | sudo tee -a /etc/systemd/system/ssh.socket.d/listen.conf
echo 'ListenStream=' | sudo tee -a /etc/systemd/system/ssh.socket.d/listen.conf
echo 'ListenStream=168' | sudo tee -a /etc/systemd/system/ssh.socket.d/listen.conf
sudo systemctl daemon-reload
sudo systemctl restart ssh
sudo ufw allow 168/tcp
sudo ufw enable
sed -i '2,17d' Secure.sh
sudo deluser ubuntu
sudo deluser --remove-home ubuntu
sudo reboot

#https://support.us.ovhcloud.com/hc/en-us/articles/4412351365139-How-to-Secure-a-VPS
#https://coderrocketfuel.com/article/remove-a-users-sudo-privileges-on-ubuntu

#https://linuxhandbook.com/remove-lines-file/
#https://www.tutorialspoint.com/run-a-script-on-startup-in-linux

