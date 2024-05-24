source common.sh
rm -f /tmp/expense.log

HEADING Disbale NodeJS Default Version
dnf module disable nodejs -y &>>/tmp/expense.log
STAT $?

HEADING Disbale NodeJS Default Version
dnf module enable nodejs:20 -y &>>/tmp/expense.log
STAT $?


HEADING Install NodeJS
dnf install nodejs -y &>>/tmp/expense.log
STAT $?




HEADING Add Expense User
useradd expense &>>/tmp/expense.log
STAT $?


HEADING SetUp Backend Service
cp backend.service /etc/systemd/system/backend.service &>>/tmp/expense.log
STAT $?

HEADING Create Application Directory
mkdir /app &>>/tmp/expense.log
STAT $?


HEADING Download Backend code
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip &>>/tmp/expense.log
cd /app

HEADING Extract Backend Code
unzip /tmp/backend.zip &>>/tmp/expense.log
STAT $?


HEADING Download NodeJS App Dependencies
npm install &>>/tmp/expense.log
STAT $?


HEADING Install MySQL CLient
dnf install mysql -y &>>/tmp/expense.log
STAT $?


HEADING Load Schema
mysql -h 172.31.22.208 -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>/tmp/expense.log
STAT $?



HEADING Start Backend Service

systemctl daemon-reload
systemctl enable backend
systemctl restart backend
STAT $?
