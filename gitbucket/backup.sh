#!/bin/bash

compose=gitbucket
all_volumes=(home)
backup_dir=$(cd $(dirname $0) && pwd)/backup

declare -A cmd
cmd[backup]='docker run --rm -v ${name}:/data -v ${backup_dir}:/backup alpine tar zcfp /backup/${file} -C / data'
cmd[restore]='docker run --rm -v ${name}:/data -v ${backup_dir}:/backup -w /data ubuntu tar zxfp /backup/${file} --strip-components=1'

func=backup

exec_cmd() {
    local volume=$1
    local name=${compose}_${volume}
    local file=${volume}.tar.gz
    eval ${cmd[${func}]}
}

usage_exit() {
    echo "Usage: ${0} [-r] [-v volume]" 1>&2
    exit 1
}

volumes=()

while getopts rv:h OPT
do
    case $OPT in
        r)  func=restore
            ;;
        v)  volumes+=($OPTARG)
            ;;
        h)  usage_exit
            ;;
        \?) usage_exit
            ;;
    esac
done

[ ${#volumes[@]} -eq 0 ] && volumes=$all_volumes

for volume in ${volumes[@]}
do
    exec_cmd $volume
done
