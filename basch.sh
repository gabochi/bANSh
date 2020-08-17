#!/bin/bash

# init time
t=0
# width (cols)
w=2
# sleep time after each line
s=0.1
#
color=0

# default expression
case ${1} in
	"-c" )
	color=1
	expression=${2:-'t * t >>10 | 61'}
	;;
	* )
	expression=${1:-'t * t >>10 | 61'}
	;;
esac

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

	[ ${color} -eq 1 ] && printf "\033[38;5;$((b&255))m"

	# old :	printf "\x$((b&63|20))"

	# new, map to valid char, convert to hex value for \x
	h=$(printf "%x" $(( (b&63)+63 )) )

	printf "\x${h}"

	#[ $((t%w)) -eq 0 ] && printf "\n" && [ "${s}" != "0" ] && sleep ${s} && w=$(tput cols)
	[ $((t%w)) -eq 0 ] && printf "\n" && [ "${s}" != "0" ] && sleep ${s} && w=$(echo "c=l($(tput cols))/l(2);scale=0;2^(c/1)" | bc -l)

done
