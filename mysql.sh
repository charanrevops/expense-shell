echo -e "\e[35mInstalling mysql server\e[0m"
dnf install mysql-server -y
echo exit status -$?

echo -e "\e[35mEnabling and starting mysql server\e[0m"
systemctl enable mysqld
systemctl start mysqld
echo exit staus -$?

echo -e "\e[35mInstallatioon and password setting of mysql server\e[0m"
mysql_secure_installation --set-root-pass $1
echo exit staus -$?
