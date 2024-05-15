echo Installing Nginx
dnf install nginx -y

echo Copy Expense Config File
cp expense.conf /etc/nginx/default.d/expense.conf

echo Clean Old Content
rm -rf /usr/share/nginx/html/*

echo Download Frontend Content
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip
cd /usr/share/nginx/html

echo Extract Content
unzip /tmp/frontend.zip

echo Restart Service
systemctl enable nginx
systemctl restart nginx 