#!/bin/bash

# init time
t=0
# width (cols)
w=64
# sleep time after each line
s=0.1

# default expression
expression='b=$(( t>>6^t%64 ))'

edit_expression(){
	printf "\033[48;5;0m\ntype another expression ('q' anywhere will exit):\n"
	read -e -i "${expression}" expression
	[[ "${expression}" == *"q"* ]] && exit
}

# interrupt calls function
trap 'edit_expression' INT

# main loop . . .

while true
do

	t=$((t+1))
	eval ${expression}
	b=$((b%256))

	printf "\033[48;5;${b}m "

	[ $((t%w)) -eq 0 ] && printf "\n" && [ "${s}" != "0" ] && sleep ${s}

done
