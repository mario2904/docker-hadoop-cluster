#!/bin/bash

# Delete master Container
echo "removing master container..."
docker rm -f master &> /dev/null

# Delete slave Containers
while read slave; do
  echo "removing $slave container..."
  docker rm -f $slave &> /dev/null
done <config/slaves

# Clear slaves file
> config/slaves
