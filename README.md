# docker-hadoop-cluster

Set up a basic Hadoop Cluster using Docker.

## Setup

Clone this repository and go to the project root directory:

```bash
git clone https://github.com/mario2904/docker-hadoop-cluster.git
cd docker-hadoop-cluster
```
Now run the following command to start the nodes. (The first time will take more time since it will first need to build the hadoop image)

```bash
docker-compose up -d
```

**Technically that's it!** But you will only have 2 active nodes by default, 1 master and 1 slave. You will need to run the following command to "scale" the slave nodes (add more slave nodes) and specify the number of slave nodes desired.

```bash
docker-compose scale slave=<num>
```

Currently there's no way to set a default/initial scale value using docker-compose. You can follow this issue https://github.com/docker/compose/issues/1661 to know more.

#### That's it!

Now you can see the default Web Interfaces at:

- NameNode - [http://localhost:50070](http://localhost:50070)
- ResourceManager - [http://localhost:8088](http://localhost:8088)
- MapReduce JobHistory Server - [http://localhost:19888](http://localhost:19888)

## Usage

There's a difference between the two commands **docker** and **docker-compose**. The first one is the core of Docker and deals mostly directly with one container at a time. The second one is used for managing many services (containers) at once of an application that uses a microservice architecture. Here are the different ways you can interact with the active nodes.

### Master Node

To access the master node run the following:

```bash
docker-compose exec master bash
```

or

```bash
docker exec -it hadoop_master_1 bash
```

### Slave Nodes

If you don't care which slave node you get to access then just run the command:

```bash
docker-compose exec slave bash
```

But, if you want to access a specific node then you **must** do it by using the docker command:

```bash
docker exec -it <name-or-identifier> bash
```

To see the generated names of all the nodes run this:

```bash
docker-compose ps
```

*** Keep in mind that the Container Name will not be the same as the Hostname of each slave node.



When you want to destroy all nodes you can run the following:

```bash
docker-compose down
```

#### Extra

You can play around with the **docker** command and do more actions such as: **stop**, **start** and **remove** to change the state of individual nodes. The same can be done with the **docker-compose** but it is for the whole cluster as a whole or per service.

As a bonus there will be a volume mounted on the master node of the directory **workspace**. Meaning that you can do all your work from your own machine and then transfer it to that directory where the master node can reach it and execute jobs.

## References

Primarily this project is forked from [kiwenlau's Project](https://github.com/kiwenlau/hadoop-cluster-docker) and then modified to use docker-compose instead of running scripts to manage the cluster.
