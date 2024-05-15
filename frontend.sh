echo -e "\e[33mInstalling Nginx\e[0m"
dnf install nginx -y

echo -e "\e[33m Copy Expense Config File\e[0m"
cp expense.conf /etc/nginx/default.d/expense.conf

echo -e "\e[33mClean Old Content\e[0m"
rm -rf /usr/share/nginx/html/*

echo -e "\e[33m Download Frontend Content\e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip
cd /usr/share/nginx/html

echo -e "\e[33m Extract Content\e[0m"
unzip /tmp/frontend.zip

echo -e "\e[33m Restart Service\e[0m"
systemctl enable nginx
systemctl restart nginx 