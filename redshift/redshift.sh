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







