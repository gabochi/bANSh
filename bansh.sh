#!/bin/bash

t=0; w=64; s=0
expresion='b=$(( t>>6^t%64 ))'

comando(){
	printf "\033[48;5;0m\ntype another expression (q for exit):\n"
	read -e -i "${expresion}" expresion
	[ "${expresion}" == "q" ] && exit
}

while true
do

	t=$((t+1))
	eval ${expresion}
	b=$((b%256))

	printf "\033[48;5;${b}m "

	[ ${s} -eq 1 ] && sleep 0

	[ $((t%w)) -eq 0 ] && printf "\n"

	trap 'comando' INT
done
