---
title: Ansible入门
---

## 安装ansible
```
apt update;apt upgrade -y;apt install wget curl sudo git vim neofetch python3 pipx sshpass -y
pipx install --include-deps ansible
pipx inject --include-apps ansible argcomplete

pipx inject ansible argcomplete

activate-global-python-argcomplete --user
pipx ensurepath
pipx completions
eval "$(register-python-argcomplete pipx)"
source ~/.bashrc
```
