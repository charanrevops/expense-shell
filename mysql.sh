source common.sh

rm -f /tmp/expense.log

if [ -z "$1" ];then
  echo Input MySQL password is missing



HEADING Installing mysql server
dnf install mysql-server -y
echo exit status -$?

HEADING Enabling and starting mysql server
systemctl enable mysqld
systemctl start mysqld
echo exit staus -$?

HEADING Installatioon and password setting of mysql server
mysql_secure_installation --set-root-pass $1
echo exit staus -$?

