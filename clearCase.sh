#!/bin/bash

# Tested on bash version 4.4.19 Kubuntu 18.10


# Bash script which cleans the directory 
# Retains only 0, constant and system directories
clear 

shopt -s extglob  # Turn on the extglob option 

GLOBIGNORE=0:constant:system:*.sh # Ignores these folders,files

echo -e  "Listing files other than 0, constant, system \n"

echo * 

echo -e "\nShall I delete all these files (y/n) ? \n "

read input 


if [ "$input" == "y" ] || [ "$input" == "Y" ]
then 
	echo -e "\nRemoving Files \n"
	rm -rf *  
	echo -e "Deleted Files..Exiting \n"
else 
	if [ "$input" == "n" ] || [ "$input" == "N" ]
	then    
		echo -e "\nNot removing files..Exiting"
	else
                echo -e  "\nNot a valid input.. Exiting"
	fi
fi

shopt -u extglob

