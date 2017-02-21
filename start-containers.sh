#!/bin/bash

# the default node number is 4
N=${1:-4}


# start hadoop master container
docker rm -f master &> /dev/null
echo "start master container..."
docker run -itd \
                --net=hadoop \
                -p 50070:50070 \
                -p 8088:8088 \
                -p 19888:19888 \
                --name master \
                --hostname master \
                -v $(pwd)/config/slaves:/usr/local/hadoop/etc/hadoop/slaves \
                -v $(pwd)/workspace:/root/workspace \
                hadoop &> /dev/null

# start hadoop slave container
i=1
> config/slaves
while [ $i -lt $N ]
do
  docker rm -f slave$i &> /dev/null
  echo "start slave$i container..."
  docker run -itd \
                  --net=hadoop \
                  --name slave$i \
                  --hostname slave$i \
                  hadoop &> /dev/null
  echo "slave$i" >> config/slaves
  i=$(( $i + 1 ))
done

# get into hadoop master container
docker exec -it master bash
