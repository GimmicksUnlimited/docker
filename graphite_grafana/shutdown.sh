#!/bin/bash

export GRAFANA_UID=`id -u`

docker-compose -f docker-compose.yml down 


echo "docker compose down is done"
