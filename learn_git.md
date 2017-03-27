*初始化一个Git仓库，使用git init命令。
*添加文件到Git仓库，分两步：
**第一步，使用命令git add <file>，注意，可反复多次使用，添加多个文件；
**第二步，使用命令git commit，完成。
*要随时掌握工作区的状态，使用git status命令。
*如果git status告诉你有文件被修改过，用git diff可以查看修改内容。
要关联一个远程库，使用命令git remote add origin git@server-name:path/repo-name.git；
关联后，使用命令git push -u origin master第一次推送master分支的所有内容；
此后，每次本地提交后，只要有必要，就可以使用命令git push origin master推送最新修改；
分布式版本系统的最大好处之一是在本地工作完全不需要考虑远程库的存在，也就是有没有联网都可以正常工作，而SVN在没有联网的时候是拒绝干活的！当有网络的时候，再把本地提交推送一下就完成了同步，真是太方便了！