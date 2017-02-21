#!/bin/bash

# Format the filesystem
$HADOOP_HOME/bin/hdfs namenode -format

# Start NameNode daemon and DataNode daemon
$HADOOP_HOME/sbin/start-dfs.sh

# Start ResourceManager daemon and NodeManager daemon
$HADOOP_HOME/sbin/start-yarn.sh

# Start the MapReduce JobHistory Server
$HADOOP_HOME/sbin/mr-jobhistory-daemon.sh start historyserver
