---
title: nginx创建网站
---


1. 安装 Nginx

如果您还没有安装 Nginx，请先安装它。可以使用以下命令在 Debian 或 Ubuntu 系统上安装：
```
sudo apt update
sudo apt install nginx
```
2. 创建一个新的网站配置文件

Nginx 配置文件通常存储在 ```/etc/nginx/sites-available/``` 和 ```/etc/nginx/sites-enabled/``` 目录中。首先，我们需要为 ```test.bismih.de``` 创建一个新的虚拟主机配置文件。
在 /etc/nginx/sites-available/ 目录下创建新的配置文件：
```
sudo nano /etc/nginx/sites-available/test.bismih.de
```
在文件中添加以下内容：
```
server {
    listen 80;
    server_name test.bismih.de;

    root /var/www/test.bismih.de;
    index index.html;

    access_log /var/log/nginx/test.bismih.de.access.log;
    error_log /var/log/nginx/test.bismih.de.error.log;

    location / {
        try_files $uri $uri/ =404;
    }
}
```
这里：
```
sudo mkdir -p /var/www/test.bismih.de
```
您可以将您的网站文件（如 index.html）放在此目录中：
```
echo "<h1>Welcome to test.bismih.de</h1>" | sudo tee /var/www/test.bismih.de/index.html
```
4. 启用虚拟主机配置

创建完虚拟主机的配置文件后，您需要通过在 /etc/nginx/sites-enabled/ 目录中创建一个符号链接来启用它：
```
sudo ln -s /etc/nginx/sites-available/test.bismih.de /etc/nginx/sites-enabled/
```
5. 检查配置并重新加载 Nginx

确保配置没有错误，然后重新加载 Nginx 服务：
```
sudo nginx -t
sudo systemctl reload nginx
```

# 配置ssl

2. 配置 Nginx 使用 SSL
编辑 Nginx 配置文件：
打开您的虚拟主机配置文件 /etc/nginx/sites-available/test.bismih.de：
sudo nano /etc/nginx/sites-available/test.bismih.de
修改配置文件以启用 HTTPS：
添加以下内容来启用 SSL：
server {
    listen 80;
    server_name test.bismih.de;

    # 301 重定向 HTTP 到 HTTPS
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name test.bismih.de;

    ssl_certificate /etc/nginx/ssl/test.bismih.de.crt;
    ssl_certificate_key /etc/nginx/ssl/test.bismih.de.key;

    # 强制使用安全的 SSL/TLS 配置
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers 'TLS_AES_128_GCM_SHA256:TLS_AES_256_GCM_SHA384:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256';
    ssl_prefer_server_ciphers on;

    root /var/www/test.bismih.de;
    index index.html;

    access_log /var/log/nginx/test.bismih.de.access.log;
    error_log /var/log/nginx/test.bismih.de.error.log;

    location / {
        try_files $uri $uri/ =404;
    }
}
配置说明：

listen 443 ssl;：监听 443 端口，并启用 SSL。
ssl_certificate 和 ssl_certificate_key 指定了证书和私钥的路径。
ssl_protocols 和 ssl_ciphers 是一些基本的 SSL/TLS 配置，确保您的站点使用强加密协议。
重新加载 Nginx 配置：
检查配置文件是否正确并重新加载 Nginx 服务：

sudo nginx -t
sudo systemctl reload nginx
3. 配置防火墙（如果适用）
确保防火墙允许 443 端口的流量。如果您使用 UFW 防火墙，可以运行：

sudo ufw allow 'Nginx Full'
4. 验证 SSL 配置
现在，您应该可以通过 https://test.bismih.de 访问您的网站，并且 SSL 应该已经启用。

测试 SSL 配置
您可以使用 SSL Labs SSL Test 测试您的 SSL 配置是否正确。

强制使用 HTTPS（可选）
如果您希望所有访问 test.bismih.de 的流量都强制使用 HTTPS，可以在 HTTP 配置部分添加 301 重定向：

server {
    listen 80;
    server_name test.bismih.de;

    # 301 重定向 HTTP 到 HTTPS
    return 301 https://$host$request_uri;
}
完成以上步骤后，您的 test.bismih.de 应该可以安全地通过 HTTPS 访问。