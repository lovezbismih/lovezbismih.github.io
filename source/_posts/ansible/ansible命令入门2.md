---
title: ansible命令入门
---

配置文件：```/etc/ansible/hosts```

## 连接local
```
ansible -i ./hosts --connection=local local -m ping
```
## 连接remote
```
ansible -i ./hosts remote -m ping
```
## 自定义配置文件
```
ansible-playbook -i /path/to/your/inventory install_docker.yml
```
## 给特定IP执行shell命令
```
---
- name: Install Docker on yourip
  hosts: yourip
  become: true  # 如果需要root权限来执行命令
  tasks:
    - name: Install Docker using the get.docker.com script
      shell: curl -fsSL https://get.docker.com | bash

```
运行剧本
```
ansible-playbook -i /etc/ansible/hosts install_docker.yml
```
## 使用ansible对yourip测试docker命令
```
ansible yourip -m shell -a "docker --version" -u root --become
```
## ansible给yourip安装nginx
### 仅安装nginx
剧本
```
---
- name: Install Nginx on yourip
  hosts: yourip
  become: true  # 提升为 root 权限
  tasks:
    - name: Install Nginx
      apt:
        name: nginx
        state: present
        update_cache: yes
```
运行剧本
```
ansible-playbook -i /etc/ansible/hosts install_nginx.yml
```
### 安装并启动nginx
```
---
- name: Install and Start Nginx on yourip
  hosts: yourip
  become: true  # 提升为 root 权限
  tasks:
    - name: Install Nginx
      apt:
        name: nginx
        state: present
        update_cache: yes
      when: ansible_os_family == "Debian"


    - name: Ensure Nginx is started and enabled
      service:
        name: nginx
        state: started
        enabled: yes
```
验证nginx服务
```
ansible yourip -m shell -a "systemctl status nginx" -u root --become
```
## 创建虚拟主机

流程：
- 配置 Nginx 虚拟主机，使其监听 test.bismih.de。
- 设置正确的 DNS 解析，将域名 test.bismih.de 指向目标主机的 IP 地址。
- 创建网站根目录，并配置网站内容。
- 重新加载 Nginx 配置。

```
---
- name: Setup SSL for test.bismih.de on yourip
  hosts: yourip
  become: true
  tasks:
    - name: Create the website document root directory
      file:
        path: /var/www/test.bismih.de
        state: directory
        owner: www-data
        group: www-data
        mode: '0755'

    - name: Create a simple index.html for test.bismih.de
      copy:
        content: |
          <html>
            <head><title>Welcome to test.bismih.de</title></head>
            <body><h1>Success! The test.bismih.de site is up and running.</h1></body>
          </html>
        dest: /var/www/test.bismih.de/index.html
        owner: www-data
        group: www-data
        mode: '0644'

    - name: Copy the SSL certificate to the target host
      copy:
        src: ~/ansi/bismih.de/1.cert
        dest: /root/ansi/bismih.de/1.cert
        owner: root
        group: root
        mode: '0644'

    - name: Copy the SSL key to the target host
      copy:
        src: ~/ansi/bismih.de/1.key
        dest: /root/ansi/bismih.de/1.key
        owner: root
        group: root
        mode: '0600'

    - name: Copy the Nginx virtual host configuration template
      copy:
        src: ~/ansi/templates/nginx_site_template.j2
        dest: /root/ansi/templates/nginx_site_template.j2
        owner: root
        group: root
        mode: '0644'

    - name: Create the Nginx virtual host configuration for test.bismih.de with SSL
      template:
        src: /root/ansi/templates/nginx_site_template.j2
        dest: /etc/nginx/sites-available/test.bismih.de
        owner: root
        group: root
        mode: '0644'

    - name: Enable the site by creating a symbolic link
      file:
        src: /etc/nginx/sites-available/test.bismih.de
        dest: /etc/nginx/sites-enabled/test.bismih.de
        state: link

    - name: Test Nginx configuration
      command: nginx -t

    - name: Reload Nginx to apply the changes
      service:
        name: nginx
        state: reloaded

```


ansible-playbook -i /etc/ansible/hosts create_website.yml
