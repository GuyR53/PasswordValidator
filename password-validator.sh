#!/bin/bash

# Getting the parameter (password) from the terminal
Password=$1

# Checking if we got have to take the pass from a file and if so we take it
if [ "$Password" = "-f" ]; then
  File=$2
  Password=$(<$File)
fi

OutMessage=""
Flag=0

# Declaring color variables for the output by tput
red=`tput setaf 1`
green=`tput setaf 2`

# Checking if length is minimum of 10 characters
if ((${#Password}<10));
then
    OutMessage+="Password is less than 10 characters!\n";
    Flag=1

fi

# Checking if pass contains both alphabet and number.
if ! [[ $Password =~ [[:alpha:]] && $Password =~ [[:digit:]] ]]; 
then
    OutMessage+="The Password must contain at least one letter and one digit!\n";
    Flag=1
fi

#Checking if pass include both small and capital case letters.
if ! [[ $Password =~ [A-Z]  && $Password =~ [a-z] ]]; 
then
    OutMessage+="The Password must contain at least one UPPERCASE and one LOWERCASE letter!";
    Flag=1
fi

# Checking whether we have an error in the pass and print out messages according to that, return exit codes
if [[ "$Flag" -eq 1 ]];
then
    echo -e ${red}$OutMessage${NC};
    exit 1
else
    echo "${green}Password is valid!"
    exit 0
fi
