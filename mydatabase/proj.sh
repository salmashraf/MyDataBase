#!/usr/bin/bash 

select i in CreateTable ListTables DropTable Insert_into_Table Select_from_Table Delete_from_Table UpdateTable
do
case $i in 
  CreateTable)
   ;; 
  ListTables)
   ls -F | grep -v "/" 
   ;; 
  DropTable)
   ;; 
  Insert_into_Table)
   ;; 
  Select_from_Table)
   ;; 
  Delete_from_Table)
   ;; 
  UpdateTable)
   ;; 
