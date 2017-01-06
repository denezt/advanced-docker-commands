# Using Docker 

``` bash
systemctl enable docker
systemctl start docker
usermod -a -G docker <username>
cat /etc/group | grep docker #should use the <username> as the group for the docker program
```

## Docker Commands

#### List images:
``` bash
docker images
```

#### List running docker processes:
``` bash
docker ps
```

#### List all processes that were ever run:

``` bash
docker ps -a
```

#### List only the container IDs:
``` bash
docker ps -a -q
```

#### Running processes:
``` bash
docker run <image>
docker run -d <image> = run in disconnected / daemon mode
docker run --name="Some Name" = name the running instance
docker start <name> = will restart a closed / exited instance of the image
docker exec -it <name> <command> = run a command within a running container without changing the state of the running container
docker stop <name> = stop a running container by using the name
```

#### Cleaning up Docker:
``` bash
docker rm containerid = removes an instance of the container that was run
docker rm `docker ps -a -q` = remove all stopped containers
docker rmi image-name = removes the docker image and its dependencies
```

#### Redirect port:
``` bash
docker run -P = will redirect the container's port to a random port on the host machine's user port (port no 32,000+)
docker run -p 8080:80 = will redirect the container's port 80 to a port 8080 on the host machine's user port 
docker port <container-name> = will list the port mapping information
```

#### Adding volume:

* using the "-v" option mounts the local file system. eg to mount for an nginx on centos
* -v /home/user/www:/usr/share/nginx/html


#### Building a Docker file:
``` bash
docker login --username=<username>
Enter password
docker push username/repo
```
