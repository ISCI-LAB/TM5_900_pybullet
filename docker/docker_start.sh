
#!/usr/bin/env bash

BASH_OPTION=bash

IMG=iscilab/tm5-pybullet:cuda-20-04
containerid=$(docker ps -qf "ancestor=${IMG}") && echo $containerid

xhost +

if [[ -n "$containerid" ]]
then
    docker exec -it \
        --privileged \
        -e DISPLAY=${DISPLAY} \
        -e LINES="$(tput lines)" \
        tm5_pybullet \
        $BASH_OPTION
else
    docker start -i tm5_pybullet
fi
