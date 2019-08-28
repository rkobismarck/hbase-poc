FROM ubuntu:16.04
LABEL maintainer="robetruj"

WORKDIR /root

RUN apt-get update && apt-get install -y openssh-server openjdk-8-jdk wget

RUN wget https://archive.apache.org/dist/hadoop/common/hadoop-2.6.5/hadoop-2.6.5.tar.gz && \
    tar -xzvf hadoop-2.6.5.tar.gz && \
    mv hadoop-2.6.5 /usr/local/hadoop && \
    rm hadoop-2.6.5.tar.gz

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 
ENV HADOOP_HOME=/usr/local/hadoop 
ENV PATH=$PATH:/usr/local/hadoop/bin:/usr/local/hadoop/sbin 

RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

RUN mkdir -p ~/hdfs/namenode && \ 
    mkdir -p ~/hdfs/datanode && \
    mkdir $HADOOP_HOME/logs

COPY config/* /tmp/

RUN mv /tmp/ssh_config ~/.ssh/config && \
    mv /tmp/hadoop-env.sh /usr/local/hadoop/etc/hadoop/hadoop-env.sh && \
    mv /tmp/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml && \ 
    mv /tmp/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml && \
    mv /tmp/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml && \
    mv /tmp/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml && \
    mv /tmp/slaves $HADOOP_HOME/etc/hadoop/slaves && \
    mv /tmp/start-hadoop.sh ~/start-hadoop.sh

RUN chmod +x ~/start-hadoop.sh && \
    chmod +x $HADOOP_HOME/sbin/start-dfs.sh && \
    chmod +x $HADOOP_HOME/sbin/start-yarn.sh 

RUN /usr/local/hadoop/bin/hdfs namenode -format

CMD [ "sh", "-c", "service ssh start; bash"]

# HDFS
EXPOSE 9000 50010 50020 50070 50075 50090
EXPOSE 9871 9870 9820 9869 9868 9867 9866 9865 9864
# MAPRED 
EXPOSE 19888
# YARN
EXPOSE 8030 8031 8032 8033 8040 8042 8088 8188
# OTHER
EXPOSE 49707 2122
# HBASE
EXPOSE 16010
# ZOOKEPER
EXPOSE 2181
