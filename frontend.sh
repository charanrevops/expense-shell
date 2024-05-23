source common.sh

rm -f /tmp/expense.log




HEADING  Nginx
dnf install nginx -y &>>/tmp/expense.log
echo exit status - $?
echo -e "\e[35mInstalling Nginx-Exit Status\e[0m-$?" &>>/tmp/expense.log

HEADING Copy Expense Config File
cp expense.conf /etc/nginx/default.d/expense.conf &>>/tmp/expense.log
echo exit status - $?
echo -e "\e[35mCopy Expense Config File-Exit Status\e[0m-$?" &>>/tmp/expense.log

HEADING Clean Old Content
rm -rf /usr/share/nginx/html/* &>>/tmp/expense.log
echo exit status - $?
echo -e "\e[35mClean Old Content-Exit Status\e[0m-$?" &>>/tmp/expense.log

HEADING Download Frontend Content
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip &>>/tmp/expense.log
echo exit status - $?

echo -e "\e[35mDownload Frontend Content-Exit Status\e[0m-$?" &>>/tmp/expense.log
cd /usr/share/nginx/html

HEADING Extract Content
unzip /tmp/frontend.zip &>>/tmp/expense.log
echo exit status - $?
echo -e "\e[35mExtract Content-Exit Status\e[0m" - $? &>>/tmp/expense.log

HEADING Restart Service
systemctl enable nginx &>>/tmp/expense.log
systemctl restart nginx &>>/tmp/expense.log
echo exit status -$?
echo -e "\e[35mRestart Service-Exit Status\e[0m-$?" &>>/tmp/expense.log