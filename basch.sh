#!/bin/bash

# init time
t=0
# width (cols)
w=2
# sleep time after each line
s=0.1

# default expression
expression='t* t>>10 &3'

edit_expression(){
	printf "\n\e[7mtype another expression ('q' anywhere will exit):\n"
	read -e -i "${expression}" expression
	printf "\e[0m"
	[[ "${expression}" == *"q"* ]] && exit
}

# interrupt calls function
trap 'edit_expression' INT

# main loop . . .

while true
do

	((t+=1))
	((b=$((${expression}))))

	[ "${1}" == "-c" ] && printf "\033[38;5;$((b&255))m"

	printf "\x$((b&63|20))"

	[ $((t%w)) -eq 0 ] && printf "\n" && [ "${s}" != "0" ] && sleep ${s} && w=$(tput cols)

done
