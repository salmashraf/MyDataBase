#!/usr/bin/bash 

select i in CreateTable ListTables DropTable Insert_into_Table Select_from_Table Delete_from_Table UpdateTable
do
case $i in 
 CreateTable)
      declare -i j=1
      read -p "Please Enter Number of columns: " number
      while (( $j < number+1 ))
      do
      read -p "Please Enter $j Argument: " argument
      read -p "Please Enter its datatype: " datatype
       ((j = $j + 1))
      done
   ;; 
 ListTables)
   ls -F | grep -v "/" 
   echo " Helloo "
   ;; 
 DropTable)
   rm $name
   ;; 
 Insert_into_Table)
   echo " hello "
   ;; 
 Select_from_Table)
   echo " hello "
   ;; 
 Delete_from_Table)
   read -p "Do you want to delete a row or column ? " answer
     if [[ $answer = [Rr]ow ]];then
        read -p "Please Enter the Table name: " name
        read -p "Please Enter the row number: " r
        ls -R /$name | grep "$r"
     elif [[ $answer = [Cc]olumn ]];then
        read -p "Please Enter the Table name: " name
        read -p "Please Enter the column number: " c
          cut -d : -f $c ~/$name
    else 
      echo " Please write wether R(r)ow or C(c)olumn"
    fi
  ;; 
   
 UpdateTable)
 echo " hello " 
   ;;
 *)
   break 
esac
done
