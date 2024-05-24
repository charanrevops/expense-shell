source common.sh

rm -f /tmp/expense.log

if [ -z "$1" ]; then
  echo Input MySQL password is missing
  exit 1
fi

STAT() {

  if [ $? -eq 0 ];then
    echo SUCCESS
  else
    echo FAILURE
    exit 2
  fi

HEADING Installing mysql server
dnf install mysql-server -y &>>/tmp/expense.log
STAT S?


HEADING Enabling and starting mysql server
systemctl enable mysqld &>>/tmp/expense.log
systemctl start mysqld &>>/tmp/expense.log
STAT S?


HEADING Installatioon and password setting of mysql server
mysql_secure_installation --set-root-pass $1 &>>/tmp/expense.log
STAT S?