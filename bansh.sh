#!/bin/bash

t=0
w=64
expresion='b=$(( t<<2 ))'

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

	if [ $((t%w)) -eq 0 ]; then printf "\n"; fi

	trap 'comando' INT
done
