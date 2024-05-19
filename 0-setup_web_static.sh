#!/usr/bin/env bash
# Setes up web servers for deployment of web static

# Update packages
sudo apt update

#Install nginx
sudo apt install -y nginx

#Create folders
sudo mkdir -p /data/web_static/releases/test/
sudo mkdir -p /data/web_static/shared

#create fake HTML hile
fake_html="
<html>
	<head>
	</head>
	<body>
		<h1>Welcome</h1>
		<p>Hello, World</p>
	</body>
</html>"
echo "$fake_html" > /data/web_static/releases/test/index.html

#Create symbolic link
ln -sf /data/web_static/releases/test/ /data/web_static/current

#Give recursive ownership to ubuntu user and group
chown -hr ubuntu:ubuntu /data/

#update nginx server content
sed -i '51 i \\n\tlocation /hbnb_static {\n\talias /data/web_static/current;\n\t}' /etc/nginx/sites-available/default

#Restart nginx
sudo service nginx restart
