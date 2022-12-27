#!/usr/bin/bash
 echo " hello "
 data=" ~/mydatabase/mydatabase/datafile.txt"
  while IFS=read -r line
  do
   echo "$line"
   done <"$input"
   read -p "In which table you want to insert ?  " table
    for i in x :
     if [ -d $table ];then
       read -p "In which category ? " category
         if [ -d $category ];then
           read -p "Please insert one element: " element
           awk -F : '{

                      for (i=1;i<(NF+1);i++) 
                      {
                            if ( $category == $0)
                             echo $element >> datafile.txt
                       
       
                      }


                     }' 
           
           else
           echo  " There's no category with such name, please check and try again."
           fi
    else 
       echo  " There's no table with such name, please check and try again."
   fi
   done   


