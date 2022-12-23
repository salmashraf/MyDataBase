#!/usr/bin/bash
export LC_COLLATE=C
shopt -s extglob
select i in CreateDB ConnectDB ListDB DropDB  
do
case $i in 
 CreateDB)
     read -p "Please Enter DB Name: " name
     echo "hello" 
     ;;
 ConnectDB)
     read -p "Please Enter DB Name: " name
     if [ -d $name ];then
       cd $name
        cd ../../mydatabase/mydatabase
           ./proj.sh
       pwd
       cd .. 
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
     
