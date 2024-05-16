rm -f /demo/expense.log
echo -e "\e[35mInstalling Nginx\e[0m"
dnf install nginx -y &>>/demo/expense.log
echo exit status - $?
echo -e "\e[35mExit Status\e[0m-$?" &>>/demo/expense.log

echo -e "\e[35mCopy Expense Config File\e[0m"
cp expense.conf /etc/nginx/default.d/expense.conf &>>/demo/expense.log
echo exit status - $?
echo -e "\e[35mExit Status\e[0m-$?" &>>/demo/expense.log

echo -e "\e[35mClean Old Content\e[0m"
rm -rf /usr/share/nginx/html/* &>>/demo/expense.log
echo exit status - $?
echo -e "\e[35mExit Status\e[0m-$?" &>>/demo/expense.log

echo -e "\e[35mDownload Frontend Content\e[0m"
curl -o /demo/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip &>>/demo/expense.log
echo exit status - $?
cd /usr/share/nginx/html
echo -e "\e[35mExit Status\e[0m-$?" &>>/demo/expense.log

echo -e "\e[35mExtract Content\e[0m"
unzip /demo/frontend.zip &>>/demo/expense.log
echo exit status - $?
echo -e "\e[35mExit Status\e[0m" - $? &>>/demo/expense.log

echo -e "\e[35mRestart Service\e[0m"
systemctl enable nginx &>>/demo/expense.log
systemctl restart nginx &>>/demo/expense.log
echo exit status -$?
echo -e "\e[35mExit Status\e[0m-$?" &>>/demo/expense.log