# Linux Handnotes

There are 300+ flavors of Linux :
```
Kali Linux :  Majority ethical hacking ppl will use this Flavor
Corporate : RedHat , CentOS ,  Ubuntu , Fedora , IBM AIX , HP_Unix , Cisco Unix ,OEL.
```

### Linux Command Standard Syntax:
.....................................

Command-name {options} {inputs} 
```
Options:
    - <Single-Character>
    -- <Single-Word>

Standard Option to all the commands is --help
    Ex: uname --help 
```

### To find out whether the system is a 32 bit or 64 bit then you can refer uname command

```
$ uname -i

x86_64   -> 64 Bit OS
i386/ i686/ i586  -> 32 Bit OS

```

### Find the Vendor of the OS.

```
$ cat /etc/*release
```

### Hardware Information about your machine in RedHat OS

CPU 
```
 $ cat /proc/cpuinfo
```
MEM 
```
 $ cat /proc/meminfo
```

DISK
```
 $ sudo fdisk -l
```

Linux Shortcuts : https://github.com/fliptheweb/bash-shortcuts-cheat-sheet

#Linux Prompts:
```
    $ -> Normal User
    # -> Root User (Administrator)
```

Files/Directories stating with dot(.) are hidden files and directories in Linux

List out existing files and directories:
```
$ ls 
$ ls -A  / ls -a
$ ls -l 
$ ls -lt 
$ ls -ltr
```

### Files:
```

 -> Create Files 
    $ touch file-name
    
    Ex: $ touch sample.txt 
    
    Note: Linux doesn't have file extensions, Extensions we keep in Linux is only for user understanding.
    
 -> Remove Files 
    $ rm file-name 
    
 -> Rename a file 
    $ mv source destination 

    Case 1: If destination doesn't exist it will re-name the file. 

    Case 2: If destination exists it will overwrite the file

 -> Copy a file 
    $ cp source  destination 
    
```
 
### What is sudo ?

```
sudo in linux is referr as a privilege escalator. This gives you the command as a root user temporarily
```

### What is . & .. ?
Dot (.) denotes present working directory 
DotDot(..) denotes parent directory 

#sudo fdisk -l  // This will lists the number of attached disks.
#sudo , this will temoporariy gives the root privilege, which means that command will be executed as a root users


# su : switch user 
```
Command to switch from one user to another user
su -, ensure you pwd will be changed along with the user

```

# Directories:

* / -> Root Directory

Types of files:
    d - Directory   
    - - Regular file 
    l - Link
    b - block devices
    c - character files 
    S - socket files 
    p - Named pipe file 

To check in which directory you are in 
    $ pwd

Change from one directory to another
    $ cd <directory>

    $ cd -> This will take you to home directory 
    $ cd - -> This will take you to previous dir 
    $ cd .. -> Takes you to parent directory 

 -> Create Directory 
    $ mkdir demo 

 -> Remove a directory 
    rm / rmdir (Empty Dir)
    $ rm -r dirname

*  Copy a directory 
    $ cp -r dir1 dir2

* *Renaming / Moving a directory
    $ mv source destination

    * If destination does not exists: Rename the directory
    * If destination exists:
         -> Destination is a file:
                Invalid operation
         -> Destination is a Directory:
                File/Directory will move inside that directory

Filters:
    -> See the complete content inside a file..
       $ cp /etc/passwd .
       $ cat passwd
       $ cat -n passwd 
       $ tac passwd 
       
head  : This prints the top 10 lines by default of the file
tail  : This prints the last/bottom 10 lines by default of the file

 -> By line numbers.
        --> Print from starting of the file 
            $ head passwd 
                It print top 10 lines 
            $ head -5 passwd 
                It print top 5 lines 

        --> Print from ending of the file 
            $ tail passwd 
                It prints last 10 lines

            $ tail -3 passwd 
                It prints last 3 lines 

sed cut awk  //These are the most power tools in linux which comes by default.

sed -n -e '10,15 p' /etc/passwd  //Prints the lines between 10 to 15

I want to print 10th line of a file
$ sed -n -e '10 p' /etc/passwd
operator:x:11:0:operator:/root:/sbin/nologin

#grep is a filter to the output as per your choice
cut -d ":" -f1,7 /etc/passwd (This prints all the lines with field1 and 7 )


Creating the users :
#useradd cloudcareers  //Creates the user
#cat /etc/group   //To see the list of users in the group
#usermod -a -G groupName UserNameToAdd   //This will add the user to the group
#passwd userName   //To change the password of the user

   

    -> Search a word and print those lines 
        Syntax: grep word file 
        $ grep ec2-user passwd 

    -> Column based filter 
        Syntax: cut -d delimeter -f number file 
        $ cut -d : -f 1 passwd 
        $ cut -d : -f 1,5 passwd
        $ cut -d : -f 1-5 passwd

EDITORS:
    ** vi / vim (so widely used)
        vim editor is not available by default in centos 7 and we need to install it, To install vim editor type the following command.
          sudo yum install vim -y
          
    ** gedit
    ** nano 
    
File Editors in Linux :
There are a lot of fancy editors in Linux --> vi ,vim , nano are few famours editors to edit the file.
They are just notepad,

The editor vi/vim works in 3 modes :
 1) ESC Mode 
 2) COLON Mode 
 3) INSERT Mode 
 
 #vim filename  --> To enter smething, yiu've to be in INSERT Mode --> pres i 
 
 After entering the data , if you want to save :
 
First clock ESC --> COLON --> wq!

wq! stands for Write and Quit which means SAVE

w --> Write
q --> Quit
! --> End of the Expression.

Using the forward slash / we can search the content.