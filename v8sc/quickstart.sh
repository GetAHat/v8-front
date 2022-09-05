#!/bin/bash

set -e

while getopts v: flag
do
    case "${flag}" in
        v) ver=${OPTARG};;
    esac
done

 if [[ $(echo $ver) ]]; then 
    export docs_folder=$(xdg-user-dir DOCUMENTS)/v8_shared
    export v8appfolder=$HOME/v8bases
    export v8ver=$ver
    mkdir -p $docs_folder
    mkdir -p $v8appfolder
    xhost + local:
    docker compose up
 else
    printf "Укажите версию в формате 8.3.17.2306 при помощи аргумента -v\n"
    exit 1
 fi

