rm -f /tmp/expense.log


HEADING()
{
  echo -e "\e[36m$*\e[0m"

}
echo -e "\e[35mInstalling Nginx\e[0m"
dnf install nginx -y &>>/tmp/expense.log
echo exit status - $?
echo -e "\e[35mInstalling Nginx-Exit Status\e[0m-$?" &>>/tmp/expense.log

echo -e "\e[35mCopy Expense Config File\e[0m"
cp expense.conf /etc/nginx/default.d/expense.conf &>>/tmp/expense.log
echo exit status - $?
echo -e "\e[35mCopy Expense Config File-Exit Status\e[0m-$?" &>>/tmp/expense.log

echo -e "\e[35mClean Old Content\e[0m"
rm -rf /usr/share/nginx/html/* &>>/tmp/expense.log
echo exit status - $?
echo -e "\e[35mClean Old Content-Exit Status\e[0m-$?" &>>/tmp/expense.log

echo -e "\e[35mDownload Frontend Content\e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip &>>/tmp/expense.log
echo exit status - $?

echo -e "\e[35mDownload Frontend Content-Exit Status\e[0m-$?" &>>/tmp/expense.log
cd /usr/share/nginx/html

echo -e "\e[35mExtract Content\e[0m"
unzip /tmp/frontend.zip &>>/tmp/expense.log
echo exit status - $?
echo -e "\e[35mExtract Content-Exit Status\e[0m" - $? &>>/tmp/expense.log

echo -e "\e[35mRestart Service\e[0m"
systemctl enable nginx &>>/tmp/expense.log
systemctl restart nginx &>>/tmp/expense.log
echo exit status -$?
echo -e "\e[35mRestart Service-Exit Status\e[0m-$?" &>>/tmp/expense.log