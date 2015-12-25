#!/bin/bash

image="ngc/gitbucket"
tag="latest"
name="gitbucket"
hostname="${name}"
shell="/bin/bash"

storage_image="ngc/gitbucket/storage:latest"
storage_name="${name}_stroge"

usage_exit() {
    echo "Usage: ${0} [-i image -t tag]" 1>&2
    exit 1
}

while getopts i:t:h OPT
do
    case ${OPT} in
        i)  image=${OPTARG}
            ;;
        t)  tag=${OPTARG}
            ;;
        h)  usage_exit
            ;;
        \?) usage_exit
            ;;
    esac
done

command docker run -d --name ${storage_name} ${storage_image} true
command docker run -d -t -i --privileged --name ${name} --hostname ${hostname} --volumes-from ${storage_name} ${image}:${tag} ${shell}
