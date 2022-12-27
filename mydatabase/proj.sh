#!/usr/bin/bash 

select i in CreateTable ListTables DropTable Insert_into_Table Select_from_Table Delete_from_Table UpdateTable 
do
case $i in 
 CreateTable)
      cp /dev/null metadatafile.txt 
      declare -i j=1
      read -p "Please Enter Table Name: " name 

      read -p "Please Enter Number of arguments: " number 
       if [[ $number = [0-9] ]];then
        echo   $name Table  >> metadatafile.txt
      while (( $j < $number+1 ))
      do
      read -p "Please Enter your Arguments (Note: first argument is pk): " argument
      echo $argument:  >> metadatafile.txt
       
       ((j = $j + 1)) 
      done
       else
        echo "please make sure you entered a number" 
      fi
    
       ;; 
 ListTables)
   ls -F | grep -v "/" 
   ;; 
 DropTable)
   read -p "Please Enter Table Name: " name
     if [ -f $name ];then
       rm $name
     else 
       echo " Table doesnot exist, if you are sure you created one, please try again " 
     fi 
     ;;
    
 Insert_into_Table)
         cp /dev/null trial.txt
         cp /dev/null metadatafile.txt
         declare -i j=1
        echo  argument     : datatype  : primarykey  >> metadatafile.txt
         read -p "Please Enter Number of arguments: " number 
          while (( $j < $number+1 ))
      do
     
      read -p "Please Enter Argument$j (Note: First Argument is the primary Key): " argument  
      read -p "Please Enter its datatype: " datatype 
      read -p "Please Enter PK value (Note: for not PK values, write npk) : " pk 
      echo  $argument           : $datatype    : $pk     >> metadatafile.txt 
      
                           ((j = $j + 1)) 
      
      done
          awk '  
            
              NR==1 {print; next}
            {
               FS=":"
              print $0
              
                  
              }'  metadatafile.txt | column -t > trial.txt 
                 
    ;;
 Select_from_Table)
     read -p "Do you want to display a row or column ? " answer
     if [[ $answer = [Rr]ow ]];then
        read -p "Please Enter the Table name: " name
        read -p "Please Enter the row name: " r
        cat ~/mydatabase/mydatabase/trial.txt | grep "$r"
     elif [[ $answer = [Cc]olumn ]];then
        read -p "Please Enter the Table name: " name
        read -p "Please Enter the column number: " c
          cut -d : -f $c ~/mydatabase/mydatabase/trial.txt 
    else 
      echo " Please write wether R(r)ow or C(c)olumn"
    fi
   ;; 
 Delete_from_Table)
   read -p "Do you want to delete a row or column or certainvalue? " answer
     if [[ $answer = [Rr]ow ]];then
        read -p "Please Enter the Table name: " name
         cd ~/mydatabase/mydatabase/trial.txt
        read -p "Please Enter the row name: " rowname
        sed '$rownumber d'trial.txt
        # if two arguments $1 $2 range
        sed '$1,$2 d' trial.txt
        # for different lines
        sed '$1;$2;$3' trial.txt
        # all lines except one 
        sed '$1,$2!d' trial.txt
         
     elif [[ $answer = [Cc]olumn ]];then
        read -p "Please Enter the Table name: " name
        read -p "Please Enter the column number: " c
          awk '{
          
          }' trial.txt
     elif [[ $answer = [Cc]ertainvalue ]];then
        read -p "Please Enter the Table name: " name
        read -p "Please Enter the value: " value     
           awk '{
           for (m=0;m<NF;m++)
                sed -i '/$value/d' ~/mydatabase/mydatabase/trial.txt
       
       }' trial.txt    
    else 
      echo " Please write one of the options R(r)ow or C(c)olumn or C(c)ertainvalue"
    fi
  ;; 
   
 UpdateTable)
 echo " hello "
      read -p "Please Enter the Table name: " name
      read -p "What is the Old value: " old
      read -p "What is the New value: " new
         awk '{
           for (m=0;m<NF;m++)
                sed 's/$old/$new/g' ~/mydatabase/mydatabase/trial.txt
       
       }' trial.txt           
            
   ;;
 *)
   break 
esac
done
