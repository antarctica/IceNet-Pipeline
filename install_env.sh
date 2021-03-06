#!/usr/bin/env bash

if [ $# -lt 1 ]; then
    echo "Usage $0 name [logname]"
    exit 1
fi

NAME=$1
LOGNAME=${2:-${0%%.sh}.log}
ERRNAME=${2:-${0%%.sh}.err}

mkdir -p logs

echo "Environment $NAME install started `date +"%F %T"`" >logs/$LOGNAME
conda env create -q --file environment.yml -n $NAME 2>logs/$ERRNAME >>logs/$LOGNAME
echo "Environment $NAME install finished `date +"%F %T"`" >>logs/$LOGNAME
