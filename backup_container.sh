#!/bin/bash
#
#
# (To do parse input)

option="${1}"

docker ps -a
read -p "Enter Container ID: " _container_id
docker ps -a | grep "${_container_id}"

save_docker_image() {
	if [ ! -z "${_container_id}" ];
	then
		read -p "Enter a name for container: " _newname
		if [ ! -z "${_newname}" ];
		then
			docker commit ${_container_id} ${_newname}
			docker save ${_newname} > /tmp/${_newname}.tar
		fi
	else
		printf "Missing container id!\n"
	fi
	}

load_docker_image(){
	read -p "Do you really want to load image? [yes|no]" _confirm
	case ${_confirm} in
		yes|y) docker load < /tmp/${_newname}.tar;;
		*) printf "cowardly, exiting from program.";;
	esac
}

case $option in
	-save) save_docker_image;;
	-load) load_docker_image;;
esac
