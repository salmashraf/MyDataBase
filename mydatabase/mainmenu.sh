#!/usr/bin/bash
export LC_COLLATE=C
shopt -s extglob
select i in CreateDB ConnectDB ListDB DropDB  
do
case $i in 
 CreateDB)
     echo "Hello" 
     regex="^[a-zA-Z]\+[0-9]$\?"
     read -p "Please Enter DB Name: " name
     if [[ $name=~$regex ]];then
      mkdir ~/mydatabase/mydatabase/$name
      touch $name.txt
     else
       echo " Name can't contain special characters,spaces or start with numbers"
     fi
     
     ;;
 ConnectDB)
     read -p "Please Enter DB Name: " name
     if [ -d $name ];then
         cd ../../mydatabase/mydatabase
           ./proj.sh

     else 
       echo " DB doesnot exist, if you are sure you created one, please try again " 
     fi 
     ;;
 ListDB)
     ls -F | grep "/" 
     ;;
 DropDB)
     read -p "Please Enter DB Name: " name
     if [ -d $name ];then
       rm -r $name
     else 
       echo " DB doesnot exist, if you are sure you created one, please try again " 
     fi 
     ;;
 *)
   break
 esac
 done
     
