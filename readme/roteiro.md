# classes iniciais 
splash, models de user e profile para apenas login.

# class Profile
criar class Profile com os campos
criar pointer em user para Profile

# email verification


# back4app

catalunha@pop-os:~/myapp/learning_about_b4a_flutter/back4app$ b4a new

catalunha@pop-os:~/myapp/learning_about_b4a_flutter/back4app$ b4a new
Would you like to create a new app, or add Cloud Code to an existing app?
Type "(n)ew" or "(e)xisting": e
1:      calcubes
2:      cemec-aluno
3:      cemec-bens
4:      classfrase
5:      eventus
6:      fluxus
7:      learning_about_b4a
8:      learning_about_b4a_2
9:      marketplace01
10:     mkp01manager
11:     noctua
12:     numbersandcalcs
13:     sisda
14:     splitcalc
15:     treeclassfrase
Select an App to add to config: 7

Please enter the name of the folder where we can download the latest deployed
Cloud Code for your app "learning_about_b4a"

Directory Name: 
You can either set up a blank project or download the current deployed Cloud Code
Please type "(b)lank" if you wish to setup a blank project, otherwise press ENTER: 
Successfully downloaded Cloud Code to "/home/catalunha/myapp/learning_about_b4a_flutter/back4app/learning_about_b4a".
Successfully configured email for current project to: "catalunha.mj@gmail.com"

# build web
catalunha@pop-os:~/myapp/learning_about_b4a_flutter$ flutter build web

# link build/web in cloud
ln -s /home/catalunha/myapp/learning_about_b4a_flutter/build/web public

catalunha@pop-os:~/myapp/learning_about_b4a_flutter/back4app/learning_about_b4a$ ls -la
total 20
drwxr-xr-x 3 catalunha catalunha 4096 Dec 13 09:20 .
drwxrwxr-x 3 catalunha catalunha 4096 Dec 13 08:10 ..
drwxr-xr-x 3 catalunha catalunha 4096 Dec 13 08:15 cloud
-rw------- 1 catalunha catalunha  187 Dec 13 08:10 .parse.local
-rw------- 1 catalunha catalunha  100 Dec 13 08:10 .parse.project
lrwxrwxrwx 1 catalunha catalunha   58 Dec 13 09:20 public -> /home/catalunha/myapp/learning_about_b4a_flutter/build/web

# deploy 

catalunha@pop-os:~/myapp/learning_about_b4a_flutter/back4app/learning_about_b4a$ b4a deploy

# telas
mostrar telas na seguencia de email verification e inativo.