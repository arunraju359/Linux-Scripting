# Shell-Scripting

Going forward, I will be using VISUAL STUDIO CODE, to develop the code locally and will preserve them on GitLab centrally.

# Authentication 

You can either use `git clone https/ssh url's`. If you use ,
```
1.  https url : You need to enter the username & password of the git all time.
2.  ssh url   : You don't have to enter any sort of userName or passwords ( Recommended option )
```

If you want to do a git clone or git push or git push without any `username/ password`, do the below process :
```
1) Move to the directory where you have the SSH Key Pair, in our case, it's batch47

$ cd batch47 
$ cat b47.pub               , copy the key and open your GitLab ---> Avatar ---> Preferences ---> SSH Keys ---> Paste your public Key
$ cp b47.pem  ~/.ssh/id_rsa  , this is going to copy your Private Key to windows .ssh home folder.
```

If the above process is completed, from your Gitbash (Windows / Terminal for Mac or Linux users), git clone will work automatic.

```
$ tester@labmachine  ~/batch47 (master)

$ git clone git@gitlab.com:clouddevops-b47/shell-scripting.git
Cloning into 'shell-scripting'...
remote: Enumerating objects: 3, done.
remote: Counting objects: 100% (3/3), done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
Receiving objects: 100% (3/3), done.
```

In Git, here is the meaning basic commands :
```
$ git clone ssh@url     : Download the repository
$ git pull  ssh@url     : Pull only the changes
$ git add  .            : Tell git to start tracking the changes
$ git commit -m "msg"   : Telling to commint your messages with your msg of what you did
$ git push              : To push your changes to the repository
```

Example of pushing code to git from local machine :
```
PS C:\Users\user\batch47\shell-scripting> git add .

PS C:\Users\user\batch47\shell-scripting>` git commit -m "Updated the ReadME file"`
[main 5773a82] Updated the ReadME file
 2 files changed, 37 insertions(+), 92 deletions(-)
 create mode 100644 .gitignore
 rewrite README.md (98%)

PS C:\Users\user\batch47\shell-scripting> git push
Enumerating objects: 6, done.
Counting objects: 100% (6/6), done.
Delta compression using up to 8 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (4/4), 1.01 KiB | 1.01 MiB/s, done.
Total 4 (delta 0), reused 0 (delta 0), pack-reused 0     
To gitlab.com:clouddevops-b47/shell-scripting.git
   687c447..5773a82  main -> main
```

### ~ : Tindyl is a symbol to denote `HOME DIRECTORY` of the user in Linux
### cd ~/  ( Change the directory to `HOME DIRECTORY`)