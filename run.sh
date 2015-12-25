#!/bin/bash

image="rxnew/gitbucket"
tag="latest"
name="gitbucket"
hostname="${name}"
shell="/bin/bash"
host_dir="`pwd`/share"
dir="/home/gitbucket/share"

storage_image="busybox"
storage_name="${name}_stroge"
storage_dir="/home/gitbucket/tomcat/webapps/gitbucket"

usage_exit() {
    echo "Usage: ${0} [-t tag]" 1>&2
    exit 1
}

while getopts t:h OPT
do
    case ${OPT} in
        t)  tag=${OPTARG}
            ;;
        h)  usage_exit
            ;;
        \?) usage_exit
            ;;
    esac
done

command docker run -d -v ${storage_dir} --name ${storage_name} ${storage_image} true
command docker run -d -t -i -p ${port}:22 --name ${name} --hostname ${hostname} --volumes-from ${storage_name} -v ${host_dir}:${dir} ${image}:${tag} ${shell}
