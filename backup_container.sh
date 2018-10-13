#!/bin/bash
#
#
# (To do parse input)


docker ps -a

read -p "Enter Container ID: " _container_id

read -p "Enter a name for container: " _newname
#
docker commit ${_container_id} ${_newname}
# 
docker save ${_newname} > /tmp/${_newname}.tar

read -p "Do you really want to load image? [yes|no]" _confirm
# 
case ${_confirm} in
	yes|y) docker load < /tmp/${_newname}.tar;;
	*) printf "cowardly, exiting from program.";;
esac
