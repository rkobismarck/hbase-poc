#!/bin/bash
rm /tmp/*.pid


service ssh start
$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh
$HBASE_HOME/bin/start-hbase.sh

bash
