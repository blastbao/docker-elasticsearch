
# 
FROM docker.gf.com.cn/gf-tomcat:20150812

# author
MAINTAINER lihuafeng <lihuafeng@gf.com.cn>


# elasticsearch
RUN mkdir /opt/elasticsearch
ADD ./src/elasticsearch-2.1.0 /opt/elasticsearch

ENV ES_HOME /opt/elasticsearch
ENV PATH $ES_HOME/bin:$PATH
RUN echo "export ES_HOME=$ES_HOME" >> /etc/profile
RUN echo "export PATH=$PATH"  >> /etc/profile

##### system settings for ElasticSearch ####
# default Java heap size
ENV ES_HEAP_SIZE 2g
RUN echo "export ES_HEAP_SIZE=$ES_HEAP_SIZE" >> /etc/profile

# file descriptors
RUN echo "* soft nofile 65535" >> /etc/security/limits.conf
RUN echo "* hard nofile 65535" >> /etc/security/limits.conf

# mmap
RUN echo "vm.max_map_count = 262144" >> /etc/sysctl.conf

# memory lock
RUN echo "* soft memlock unlimited" >> /etc/security/limits.conf
RUN echo "* hard memlock unlimited" >> /etc/security/limits.conf


RUN mkdir /opt/es/data -p
RUN mkdir /opt/es/logs -p
# user
RUN useradd -s /bin/bash -d /home/es es
RUN chmod 755 $ES_HOME/bin/*
RUN chmod 777 /opt/es -R
USER es
EXPOSE 9200
EXPOSE 9300


WORKDIR /opt/elasticsearch
#
CMD $ES_HOME/bin/elasticsearch




