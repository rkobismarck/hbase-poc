FROM rko/hadoop-cluster-base
LABEL maintainer="robetruj"

WORKDIR /root

RUN wget http://www-us.apache.org/dist/hbase/stable/hbase-1.4.10-bin.tar.gz && \
    tar -xzvf hbase-1.4.10-bin.tar.gz && \
    mv hbase-1.4.10 /usr/local/hbase && \
    rm hbase-1.4.10-bin.tar.gz

ENV HBASE_HOME=/usr/local/hbase
ENV PATH=$PATH:$HBASE_HOME/bin

RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> /usr/local/hbase/conf/hbase-env.sh
RUN echo "export HBASE_REGIONSERVERS=${HBASE_HOME}/conf/regionservers" >> /usr/local/hbase/conf/hbase-env.sh
RUN echo "export HBASE_MANAGES_ZK=true" >> /usr/local/hbase/conf/hbase-env.sh

ADD config/hbase-site.xml /usr/local/hbase/conf/hbase-site.xml
ADD config/bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh

ENV BOOTSTRAP /etc/bootstrap.sh

CMD ["/etc/bootstrap.sh", "-d"]

