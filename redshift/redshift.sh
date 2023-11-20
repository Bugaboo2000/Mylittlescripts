#!/bin/bash



while true; do
read -p "Do you want to enable reshift?[Y/n]" Yn
    case $Yn in 
    
[Yy]*)  

redshift -O 5500;
break;;


[Nn]*)
redshift -x;
break;;

*)
esac
    done    

locate(){

if[find ~/ -type f -name "*redshift.conf"] then;
exit 0;

}


deps(){
if[-x "$(command -v find)"] then;

$locate 

}







