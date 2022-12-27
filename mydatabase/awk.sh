#!/usr/bin/bash
 echo " hello "
 data=" ~/mydatabase/mydatabase/datafile.txt"
 awk -F : '{

                      for (i=1;i<(NF+1);i++) 
                         read -p "Please enter $i Argument: " argument
                         if [ -e $argument ]
                           echo "This Number already exists, Please try again"
                         else 
                           re='^[0-9]+$'
                           if [[ $argument =~ $re ]] ; then
                             echo $argument >> datafile.txt
                            else 
                             echo "Data Types do not match" 
                            fi
                          fi
                        }' datafile.txt
  read -p "Please enter  " table
  read -p "In which table you want to insert ?  " table
    grep "$table" data 
     if [ -e $table ];then
       read -p "In which category ? " category
         if [ -e $category ];then
           read -p "Please insert one element: " element
           awk -F : '{

                      for (i=1;i<(NF+1);i++) 
                      {
                            if ( $category == $0)
                             echo $element >> $0
                       
       
                      }


                     }' 
           
           else
           echo  " There's no category with such name, please check and try again."
           fi
    else 
       echo  " There's no table with such name, please check and try again."
   fi
      


