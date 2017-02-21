# docker-hadoop-cluster

Set up a basic Hadoop Cluster using Docker.

## Setup

Clone this repository and go to the project root directory:

```bash
git clone https://github.com/mario2904/docker-hadoop-cluster.git
cd docker-hadoop-cluster
```
Build the image using the Dockerfile and name it **hadoop**. (This will take a while but it's just a one time thing)

```bash
docker build -t hadoop .
```

Create a private network named **hadoop** for the cluster

```bash
docker network create hadoop
```

Run script to create the containers. Optionally pass a parameter to indicate the number of nodes. Defaults to 4 nodes, 1 master and 3 slaves. When finished you will have been ssh'd into the master node as root. 

```bash
sh start-containers.sh <nodes>
```

Run init script that will start all the necessary hadoop daemons and format the HDFS.

```bash
./init.sh
```

#### That's it!

Now you can see the default Web Interfaces at:

- NameNode - [http://localhost:50070](http://localhost:50070)
- ResourceManager - [http://localhost:8088](http://localhost:8088)
- MapReduce JobHistory Server - [http://localhost:19888](http://localhost:19888)

## Usage

You can exit at anytime from the master node. To access the master node again just run the following command:

```bash
docker exec -it master bash
```

When you get tired of it, you can destroy all the nodes using another script.

```bash
sh remove-containers.sh
```

As a bonus there will be a volume mounted on the master node of the directory **workspace**. Meaning that you can do all your work from your own machine and then transfer it to that directory where the master node can reach it and execute jobs.

## References

Primaily this project is forked from [kiwenlau's Project](https://github.com/kiwenlau/hadoop-cluster-docker).