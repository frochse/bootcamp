#!/bin/bash 

option="${1}"
gebruiker="${2}"

maakgebruiker() {
	local user_arg=${1}
	useradd -d "/home/${user_arg}" -m -p qw34er ${user_arg}
}

verwijdergebruiker() {
	local user_arg=${1}
	userdel ${user_arg}
}	


if [ -z "${gebruiker}" ] || [ -z "${option}" ]
then
 echo "usage: sudo demo.sh <option - maakgebruiker|verwijdergebruiker> <gebruikersnaam>"
 exit 0
fi 

case $option in

  maakgebruiker)
    echo  "maak gebruiker" ${gebruiker}
    maakgebruiker ${gebruiker} 
    ;;

  verwijdergebruiker)
    echo  "verwijder gebruiker"
    verwijdergebruiker ${gebruiker}
    ;;

  *)
    echo "onbekende functie gebruik: maakgebruiker of verwijdergebruiker"
    echo ""
    ;;
esac

