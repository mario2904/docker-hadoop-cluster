#!/bin/bash

# Create default HDFS directories
hadoop fs -mkdir       /tmp
hadoop fs -mkdir -p    /user/hive/warehouse
hadoop fs -chmod g+w   /tmp
hadoop fs -chmod g+w   /user/hive/warehouse

# Run schema tool command. Set "derby" as db type
schematool -dbType derby -initSchema
