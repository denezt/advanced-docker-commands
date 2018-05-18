# Troubleshooting Docker


## Bugfix #001

### Received the following error:
* write pipe: bad file descriptor

### Correcting the problem
* Ensure that the correct architecture is chosen.

#### Example:

``` bash
docker run -it ubuntu #This is an auto selector and might choose wrong architecture
``` 
<center style="color:blue;">--[instead use this]--</center>

``` bash
docker run -it i386/ubuntu #This is an auto selector and might choose wrong architecture
``` 









