#!/bin/bash
# Written By: Richard Jackson
# Created: 12 OCT 2018
#

option="${1}"

error(){
	[ ! -z "${1}" ] && printf "Error: \033[31m${1}\033[0m\n" || \
	printf "Error: \033[31mUnknown Error Occurred!\033[0m\n"
	}

save_docker_image() {
	read -p "Enter Container ID: " _container_id
	__valid_image=$(docker ps -a | grep "${_container_id}")
	if [ ! -z "${__valid_image}" ];
	then
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
	else
		error "Invalid image id was given"
	fi
	}

load_docker_image(){
	read -p "Enter Backup Image Archive: " _image_backup
	if [ -e "/tmp/${_image_backup}.tar" ];
	then
		read -p "Do you really want to load image? [yes|no]" _confirm
		case ${_confirm} in
			yes|y) docker load < /tmp/${_image_backup}.tar;;
			*) printf "cowardly, exiting from program.";;
		esac
	else
		error "Unable to find archive file!"
	fi
	}

validate_docker(){
	__docker_state=$(docker ps -a | echo $?)
	echo "${__docker_state}"
	}

help_menu(){
	printf "Backup/Load Containers\n"
	printf "Save Docker Image [ -s, -save, --save ]\n"
	printf "Load Docker Image [ -l, -load, --load ]\n"
	}

case $option in
	-s|-save|--save) save_docker_image;;
	-l-load|--load) load_docker_image;;
	-v|-validate|--validate) validate_docker;;
	-h|-help|--help) help_menu;;
	*) error "Missing or invalid parameter was given";;
esac
