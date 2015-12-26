#!/bin/bash

image="ngc/gitbucket"
tag="latest"
name="gitbucket"
hostname="${name}"
shell="/bin/bash"
host_dir="`pwd`/share"
guest_dir="/home/gitbucket/share"

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

storage_image="${image}/storage:latest"
storage_name="${name}_stroge"

command docker run -d -v /etc/localtime:/etc/localtime:ro -v ${host_dir}:${guest_dir} --name ${storage_name} ${storage_image} true
command docker run -d -t -i --privileged -v /etc/localtime:/etc/localtime:ro --name ${name} --hostname ${hostname} --volumes-from ${storage_name} ${image}:${tag} ${shell}
