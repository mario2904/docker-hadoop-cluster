#!/bin/bash

# Stop NameNode daemon and DataNode daemon
$HADOOP_HOME/sbin/stop-dfs.sh

# Stop ResourceManager daemon and NodeManager daemon
$HADOOP_HOME/sbin/stop-yarn.sh

# Start the MapReduce JobHistory Server
$HADOOP_HOME/sbin/mr-jobhistory-daemon.sh stop historyserver
