# Media Compose

List of containers on the file *docker-compose*

- Portainer
- PiHole
- Bitwarden
- Plex
- Taitulli
- Ombi

```
docker-compose up -d
```

List of containers on the file *docker-compose.full*

- Portainer
- Bitwarden
- Plex
- Taitulli
- Ombi
- Grafana
- Telegraf
- InfluxDB

```
docker-compose -f docker-compose.full.yml -p Media up -d
```

#### **NOTE:** *REMEMBER TO RUN THE COMPOSE FILE AS ROOT*
