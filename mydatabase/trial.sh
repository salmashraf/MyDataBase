#!/usr/bin/bash

 declare -i j=1
      myarray=[]
            read -p "Please Enter Number of rows: " number 
     while (( $j < number+1 ))
      do
      if (j=1);then
      read -p "Please Enter Argument $j (Note: First Argument is the primary Key): " argument  
      read -p "Please Enter its datatype: " datatype 
      read -p "Please Enter PK value (Note: for not PK values, write npk) : " pk 
      echo  argument     : datatype  : primarykey  >> datafile.txt
      echo  $argument           : $datatype    : $pk     >> datafile.txt | column -t

      
                           ((j = $j + 1)) 
      else 
      echo "error" 
      fi 
      done
