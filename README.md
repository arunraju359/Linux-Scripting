# Shell-Scripting

Going forward, I will be using VISUAL STUDIO CODE, to develop the code locally and will preserve them on GitLab centrally.

# Authentication 

```
You can either use `git clone https/ssh url's`. If you use ,

1.  https url : You need to enter the username & password of the git all time.
2.  ssh url   : You don't have to enter any sort of userName or passwords ( Recommended option )
```

If you want to do a git clone or git push or git push without any username/ password, do the below process :
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

