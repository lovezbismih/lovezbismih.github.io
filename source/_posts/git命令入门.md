---
title: git命令入门
---
1. 安装 Git
如果您的系统还没有安装 Git，可以通过以下命令安装：

在 Ubuntu/Debian 上安装 Git：



sudo apt update
sudo apt install git
在 macOS 上安装 Git：



brew install git
在 Windows 上安装 Git： 访问 Git 官网，下载并安装适用于 Windows 的 Git 客户端。

2. 基本配置
安装 Git 后，首先需要配置用户信息：



git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
这样设置之后，Git 会在提交时使用您的姓名和邮箱。

3. 创建和克隆仓库
(1) 创建一个新的 Git 仓库
在您想要创建 Git 仓库的目录中，运行以下命令：



mkdir my-project
cd my-project
git init
git init 会在当前目录中初始化一个新的 Git 仓库，并创建一个 .git 文件夹来跟踪版本控制。

(2) 克隆现有仓库
如果您想要从远程仓库克隆一个项目，可以使用 git clone 命令：



git clone https://github.com/username/repository.git
4. 基本的 Git 操作
(1) 查看当前状态
使用 git status 来查看工作目录和暂存区的状态：



git status
它会显示您当前文件的状态（如已修改、未跟踪、已暂存等）。

(2) 添加文件到暂存区
在做了文件修改后，您需要使用 git add 将更改的文件添加到 Git 暂存区（staging area）：



git add <filename>
# 或者添加所有文件
git add .
(3) 提交更改
将文件提交到本地仓库：



git commit -m "Your commit message"
提交时最好写上有意义的提交信息，用于记录修改的内容。

(4) 查看提交历史
查看项目的提交历史：



git log
您可以加上一些选项来格式化输出：



git log --oneline  # 简化每个提交的显示
5. 分支操作
(1) 查看分支
查看当前 Git 仓库中的所有分支：



git branch
(2) 创建新分支
创建一个新的分支：



git branch new-branch-name
(3) 切换分支
切换到另一个分支：



git checkout branch-name
或者在创建分支的同时切换到该分支：



git checkout -b new-branch-name
(4) 合并分支
将一个分支的修改合并到当前分支：



git merge branch-name
(5) 删除分支
如果不再需要某个分支，可以将其删除：



git branch -d branch-name
6. 远程仓库操作
(1) 查看远程仓库
查看当前项目的远程仓库信息：



git remote -v
(2) 添加远程仓库
如果您有一个远程仓库地址，可以使用 git remote add 来添加远程仓库：



git remote add origin https://github.com/username/repository.git
(3) 推送到远程仓库
将本地提交推送到远程仓库的某个分支：



git push origin branch-name
(4) 从远程仓库拉取更新
将远程仓库的更改拉取到本地：



git pull origin branch-name
(5) 获取远程仓库的更改
获取远程仓库的更改，但不进行合并：



git fetch
7. 文件恢复操作
(1) 撤销未暂存的更改
如果您修改了文件，但尚未 git add，可以使用以下命令恢复文件到上次提交的状态：



git checkout -- <filename>
(2) 撤销已暂存的更改
如果文件已经被 git add 暂存，您可以使用 git reset 撤销暂存：



git reset <filename>
(3) 撤销上次提交
如果提交了不想要的更改，可以使用以下命令撤销上次的提交（但保留更改）：



git reset --soft HEAD~1
8. 常用技巧
(1) 忽略文件
如果您想让 Git 忽略某些文件（例如，临时文件、IDE 配置等），可以创建一个 .gitignore 文件：



echo "*.log" >> .gitignore
echo "*.tmp" >> .gitignore
(2) 查看所有 Git 配置信息
查看 Git 配置文件中的所有设置：



git config --list