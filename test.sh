t=0

expresion='t'

while true
do

printf "\n"
read -e -i "${expresion}" expresion

for i in {0..63}
do
	((o=$((${expresion}))))
	printf "${o}; "
	((t=t+1))

done

done
