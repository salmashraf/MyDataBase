#!/usr/bin/bash

select i in CreateDB ConnectDB ListDB CreateTable ListTable
do
case $i in 
 CreateDB)
     read -p "Please Enter DB Name: " name
     if [ -e $name ];then
       echo " Error " 
     else 
       mkdir $name
     fi 
     ;;
 ConnectDB)
     read -p "Please Enter DB Name: " name
     if [ -d $name ];then
       cd $name
       pwd
       cd .. 
     else 
       echo " DB doesnot exist, if you are sure you created one, please try again " 
     fi 
     ;;
 ListDB)
     ls -F | grep "/" 
     ;;
 ListTable)
     ls -F | grep -v "/" 
     ;;
 *)
   break
 esac
 done
     
