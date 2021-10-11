#! /usr/bin/env bash 

#
# Author: Dennis in 't Groen <dgroen@virtualsciences.nl>
#
#/ Usage: SCRIPTNAME [OPTIONS]... [ARGUMENTS]...
#/
#/
#/ OPTIONS
#/ -h, --help
#/ Print this help message
#/
#/ EXAMPLES
#/
 
 
#{{{ Bash settings
# abort on nonzero exitstatus
set -o errexit
# abort on unbound variable
set -o nounset
# don't hide errors within pipes
set -o pipefail
#}}}
#{{{ Variables
readonly script_name=$(basename "${0}")
readonly script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
IFS=$'\t\n' # Split on newlines and tabs (but not on spaces)
 
#}}}

maakgebruiker() {
	local user_arg=${1}
	useradd -d "/home/${user_arg}" -m -p qw34er ${user_arg}
}

verwijdergebruiker() {
	local user_arg=${1}
	userdel ${user_arg}
}	

check_args(){
 echo ${@}
if [ "$#" -ne 2 ]; then
  echo "usage: sudo demo.sh <option - maakgebruiker|verwijdergebruiker> <gebruikersnaam>"
  exit 0
 fi 

} 

main() {

check_args "${@}"

local option="${1}"
local gebruiker="${2}"

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


}
 

main "${@}"
 

