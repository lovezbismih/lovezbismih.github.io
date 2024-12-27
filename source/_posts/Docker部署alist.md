---
title: Docker命令入门
---
安装docker
```
curl -fsSL https://get.docker.com | bash
```

```
docker run -d --restart=unless-stopped -v /etc/alist:/opt/alist/data -p 5244:5244 -e PUID=0 -e PGID=0 -e UMASK=022 --name="alist" xhofe/alist-aria2
docker exec -it alist ./alist admin set df3gsdf.
```