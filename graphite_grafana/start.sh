#!/bin/bash


while getopts d: flag
do 
   case "${flag}" in
       d) datadir=${OPTARG};;
   esac
done


if [[ $datadir == "" ]]
  then
	echo "Data directory not specified"
        exit 2 
else
    echo "Data dir: $datadir"
fi


export GRAPHITE_DATA=$datadir/graphite
export GRAFANA_DATA=$datadir/grafana

export GRAFANA_UID=`id -u`

docker-compose -f docker-compose.yml up -d


echo "docker compose is done"
