t=0

expresion='t'

while true
do

read -e -i "${expresion}" expresion

for i in {0..63}
do
	((t=t+1))
	((o=$((${expresion}))))
	printf "${o}; "
done

done
