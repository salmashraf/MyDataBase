#!/usr/bin/bash 

select i in CreateTable ListTables DropTable Insert_into_Table Select_from_Table Delete_from_Table UpdateTable
do
case $i in 
 CreateTable)
         cp /dev/null datafile.txt 
      declare -i j=1
      myarray=[]
      read -p "Please Enter Table Name: " name 
      read -p "Please Enter Number of rows: " number 
      echo   $name Table  >> datafile.txt
      echo  Number of rows is $number 
      echo  argument     : datatype  : primarykey  >> datafile.txt
       while (( $j < number+1 ))
      do
      if (j=1);then
      read -p "Please Enter Argument $j (Note: First Argument is the primary Key): " argument  
      read -p "Please Enter its datatype: " datatype 
      read -p "Please Enter PK value (Note: for not PK values, write npk) : " pk 
      echo  $argument           : $datatype    : $pk     >> datafile.txt 
      
                           ((j = $j + 1)) 

      else
     
      read -p "Please Enter $j Argument: " argument  
      read -p "Please Enter its datatype: " datatype 
       
      fi
     done
      ;; 
 ListTables)
   ls -F | grep -v "/" 
   echo " Helloo "
   ;; 
 DropTable)
   read -p "Please Enter Table Name: " name
     if [ -d $name ];then
       rm $name
     else 
       echo " Table doesnot exist, if you are sure you created one, please try again " 
     fi 
     ;;
    
 Insert_into_Table)
   
    cd ~/mydatabase/mydatabase
    ./awk.sh
    ;;
 Select_from_Table)
     read -p "Do you want to delete a row or column ? " answer
     if [[ $answer = [Rr]ow ]];then
        read -p "Please Enter the Table name: " name
        read -p "Please Enter the row name: " rowname
        cat ~/mydatabase/mydatabase/datafile.txt | grep "$rowname"
     elif [[ $answer = [Cc]olumn ]];then
        read -p "Please Enter the Table name: " name
        read -p "Please Enter the column number: " c
          cut -d : -f $c ~/mydatabase/mydatabase/datafile.txt 
    else 
      echo " Please write wether R(r)ow or C(c)olumn"
    fi
   ;; 
 Delete_from_Table)
   read -p "Do you want to delete a row or column ? " answer
     if [[ $answer = [Rr]ow ]];then
        read -p "Please Enter the Table name: " name
        read -p "Please Enter the row name: " rowname
        cat datafile.txt | grep "rowname" 
        sed '$rownumber d'datafile.txt
        # if two arguments $1 $2 range
        sed '$1,$2 d' datafile.txt
        # for different lines
        sed '$1;$2;$3' datafile.txt
        # all lines except one 
        sed '$1,$2!d' datafile.txt
         
     elif [[ $answer = [Cc]olumn ]];then
        read -p "Please Enter the Table name: " name
        read -p "Please Enter the column number: " c
          cut -d : -f $c ~/$name
          awk '{$c=""; print $0}' datafile.txt
    else 
      echo " Please write wether R(r)ow or C(c)olumn"
    fi
  ;; 
   
 UpdateTable)
 echo " hello "
         cp /dev/null trial.txt 
 input_array=(12 35 56)
           awk -v str="${input_array[*]}" '
            BEGIN{split(str,a)}
            NR==1 {print; next}
            {print $0, a[++cnt]} '  datafile.txt | column -t > trial.txt
   ;;
 *)
   break 
esac
done
