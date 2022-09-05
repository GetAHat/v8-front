#!/bin/bash

set -e

while getopts v: flag
do
    case "${flag}" in
        v) ver=${OPTARG};;
    esac
done

if [[ $(echo $ver) ]]; then 
    printf "Укажите версию в формате 8.3.17.2306 при помощи аргумента -v"
    exit 1
fi

export docs_folder=$(xdg-user-dir DOCUMENTS)
export v8appfolder=$HOME/v8bases

mkdir -p $docs_folder/v8_shared
mkdir -p $v8appfolder
xhost + local:

docker compose build
docker run -d --name v8_thick_client -e v8ver=ver v8-thick:0.1