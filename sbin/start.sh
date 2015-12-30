
# ElsaticSearch's docker image

host_data=/opt/es
docker_data=/opt/es
host_conf=/opt/elasticsearch/conf
docker_conf=/opt/elasticsearch/config

name=elasticsearch
#image=docker.gf.com.cn/elasticsearch:2.1.0
image=elasticsearch:2.1.0

# es settings
ES_HEAP_SIZE=24g

docker pull $image

sudo docker run -d --net=host \
-v $host_data/data:$docker_data/data -v $host_data/logs:$docker_data/logs \
-v $host_conf/elasticsearch.yml:$docker_conf/elasticsearch.yml -e ES_HEAP_SIZE=$ES_HEAP_SIZE --name $name $image


