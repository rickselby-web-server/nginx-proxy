#!/bin/bash

declare -a networks=(
  "portainer"
)

for ((i=0; i < ${#networks[@]}; i++))
do
  echo "${networks[$i]}"
  docker network create --subnet 172.18.$i.0/24 --gateway 172.18.$i.1 "${networks[$i]}"
  docker network connect "${networks[$i]}" nginx-proxy
done

