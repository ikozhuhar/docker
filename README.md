# docker

```
sudo docker network create -d bridge monitoring
sudo docker run -d --name=prometheus --network=monitoring -p 9090:9090 bitnami/prometheus:latest
sudo docker run -d --name=node_exporter --network=monitoring -p 9100:9100 carlosedp/node_exporter
sudo docker run -d --name=grafana --network=monitoring -p 3000:3000 grafana/grafana-enterprise
```

/etc/docker/daemon.json
```
{  "bip": "172.31.255.129/24", "fixed-cidr": "172.31.255.129/24", "registry-mirrors": ["https://mirror.gcr.io"] }
```

[docs.docker.com](https://docs.docker.com/manuals/)
