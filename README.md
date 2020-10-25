# Media Compose

List of containers on the file **[docker-compose](https://raw.githubusercontent.com/KutonnoZer0/MediaCompose/main/docker-compose.yml)**

- [Portainer](https://www.portainer.io/)
- [Bitwarden](https://bitwarden.com/)
- [Plex](https://www.plex.tv/)
- [Taitulli](https://tautulli.com/)
- [Ombi](https://ombi.io/)
- [NGINX](https://www.nginx.com/products/)

```
docker-compose up -d
```

List of containers on the file **[docker-compose.pihole](https://raw.githubusercontent.com/KutonnoZer0/MediaCompose/main/docker-compose.pihole.yml)**

- [Portainer](https://www.portainer.io/)
- [Bitwarden](https://bitwarden.com/)
- [Plex](https://www.plex.tv/)
- [Taitulli](https://tautulli.com/)
- [Ombi](https://ombi.io/)
- [PiHole](https://pi-hole.net/)
- [NGINX](https://www.nginx.com/products/)
```
docker-compose -f docker-compose.pihole.yml -p Media up -d
```
List of containers on the file **[docker-compose.full](https://raw.githubusercontent.com/KutonnoZer0/MediaCompose/main/docker-compose.full.yml)**

- [Portainer](https://www.portainer.io/)
- [Bitwarden](https://bitwarden.com/)
- [Plex](https://www.plex.tv/)
- [Taitulli](https://tautulli.com/)
- [Ombi](https://ombi.io/)
- [InfluxDB](https://www.influxdata.com/)
- [Grafana](https://grafana.com/)
- [NGINX](https://www.nginx.com/products/)
```
docker-compose -f docker-compose.full.yml -p Media up -d
```
List of containers on the file **[docker-compose.full.pihole](https://raw.githubusercontent.com/KutonnoZer0/MediaCompose/main/docker-compose.full.pihole.yml)**

- [Portainer](https://www.portainer.io/)
- [Bitwarden](https://bitwarden.com/)
- [Plex](https://www.plex.tv/)
- [Taitulli](https://tautulli.com/)
- [Ombi](https://ombi.io/)
- [PiHole](https://pi-hole.net/)
- [InfluxDB](https://www.influxdata.com/)
- [Grafana](https://grafana.com/)
- [NGINX](https://www.nginx.com/products/)
```
docker-compose -f docker-compose.full.pihole.yml -p Media up -d
```

# Ports Layout
| Container | Local Port | Container Port |
| --------- | :----------: | :--------------: |
| Portainer | 9000 | 9000 |
| Bitwarden | 8083 | 80 |   
| Plex  | 32400 | 32400 |
| Taitulli | 8181 | 8181 |
| Ombi | 3579 | 3579 |
| Grafana  | 3000 | 3000 |
| InfluxDB | 8086 | 8086 | 
| SWAG | 4343 | 443 |
-------------------


Webui can be found at 
```
<your-ip>:<local port> or https://localhost:<local port>
```
For plex will be 
```
<your-ip>:<local port>/web or https://localhost:<local port>/web
```
And for Pi hole will be 
```
<your-ip>/admin
```

## **NOTE:** 

Folder Location

```
The compose file use /home/Data/ as a main directory.
```


Bitwarden

```
 Is high recommended that you generate a random token by typing openssl rand -base64 48 on the terminal and add the token on the "ADMIN_TOKEN=" flag.

 After finish adding the users is recommended to disable the option for adding more user also is recommendable to disable the admin token.
```

### *REMEMBER TO RUN THE COMPOSE FILE AS ROOT*
