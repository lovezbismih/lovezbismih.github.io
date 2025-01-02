---
title: serv00 
---
### 介绍：[serv00](https://www.serv00.com/)是一个托管网站，可以申请免费虚拟主机



##  一、保号教程

1. Fork仓库
2. 配置Secrets
    1. ```ACCOUNTS_JSON```
       
        ```
        [
        {"username": "serv00的账号", "password": "serv00的密码", "panel": "panel6.serv00.com"},
        {"username": "ct8的账号", "password": "ct8的密码", "panel": "panel.ct8.pl"},
        {"username": "user2", "password": "password2", "panel": "panel6.serv00.com"}
        ]
        ```
    2. ```TELEGRAM_BOT_TOKEN```：机器Token```@botfather```

    3. ```TELEGRAM_CHAT_ID```: 个人chatID```@userinfocbot```
3. 开启action和workflow
4. 运行workflow

> 相关工具仓库：https://github.com/yixiu001/serv00-login

---

## 二、serv00-play工具箱

```
bash <(curl -Ls https://raw.githubusercontent.com/frankiejun/serv00-play/main/start.sh)
```

目前有的功能：

| 序号 | 功能描述                 | 序号 | 功能描述             | 序号 | 功能描述               |
| ---- | ------------------------ | ---- | -------------------- | ---- | ---------------------- |
| 1    | 安装/更新serv00-play项目 | 6    | 设置保活的项目       | 11   | 快照恢复               |
| 2    | sun-panel                | 7    | 配置sing-box         | 12   | 系统初始化             |
| 3    | webssh                   | 8    | 运行sing-box         | 13   | 前置工作及设置中国时区 |
| 4    | 阅后即焚                 | 9    | 停止sing-box         | 14   | 管理哪吒探针           |
| 5    | 待开发                   | 10   | 显示sing-box节点信息 | 15   | 卸载探针               |
| 16   | 设置彩色开机字样         | 17   | 显示本机IP           | 18   | mtproto代理            |
| 19   | alist管理                | 20   | 端口管理             | 21   | 域名证书管理           |
| 22   | 一键root                 | 23   | 自动检测主机IP状态   | 24   | 一键更换hy2的IP        |
| 25   | 卸载                     |      |                      |      |                        |

> 相关工具仓库：https://github.com/frankiejun/serv00-play

---

## 三、一键搭建四个协议节点

四个协议：vmess-ws|vmess-ws-tls(argo)|hy2|tuic5

```
bash <(curl -Ls https://raw.githubusercontent.com/eooce/sing-box/main/sb_serv00.sh)
```

> 使用工具仓库：https://github.com/eooce/Sing-box

甬哥版本四协议脚本(reality)

```
curl -sSL https://raw.githubusercontent.com/yonggekkk/Cloudflare_vless_trojan/main/serv00.sh -o serv00.sh && bash serv00.sh
```

> 使用工具仓库：https://github.com/yonggekkk/Cloudflare_vless_trojan

