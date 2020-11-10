# Home Server

For quick start run the follow commands

```
apt install -y git
git clone https://github.com/KutonnoZer0/MediaCompose.git
cd MediaCompose
sh setup.sh
```

## Media Compose

List of containers on the file **[docker-compose](https://raw.githubusercontent.com/KutonnoZer0/MediaCompose/main/Compose/docker-compose.yml)**

- [Portainer](https://www.portainer.io/)
- [Plex](https://www.plex.tv/)
- [Taitulli](https://tautulli.com/)
- [Ombi](https://ombi.io/)

```
docker-compose up -d
```

List of containers on the file **[docker-compose.pihole](https://raw.githubusercontent.com/KutonnoZer0/MediaCompose/main/Compose/docker-compose.pihole.yml)**

- [Portainer](https://www.portainer.io/)
- [Bitwarden](https://bitwarden.com/)
- [Plex](https://www.plex.tv/)
- [Taitulli](https://tautulli.com/)
- [Ombi](https://ombi.io/)
- [NextCloud](https://nextcloud.com/)
- [PiHole](https://pi-hole.net/)
- [WireGuard](https://www.wireguard.com/)
```
docker-compose -f docker-compose.pihole.yml -p Media up -d
```
List of containers on the file **[docker-compose.full](https://raw.githubusercontent.com/KutonnoZer0/MediaCompose/main/Compose/docker-compose.full.yml)**

- [Portainer](https://www.portainer.io/)
- [Bitwarden](https://bitwarden.com/)
- [Plex](https://www.plex.tv/)
- [Taitulli](https://tautulli.com/)
- [Ombi](https://ombi.io/)
- [InfluxDB](https://www.influxdata.com/)
- [Grafana](https://grafana.com/)
```
docker-compose -f docker-compose.full.yml -p Media up -d
```
List of containers on the file **[docker-compose.full.pihole](https://raw.githubusercontent.com/KutonnoZer0/MediaCompose/main/Compose/docker-compose.full.pihole.yml)**

- [Portainer](https://www.portainer.io/)
- [Bitwarden](https://bitwarden.com/)
- [Plex](https://www.plex.tv/)
- [Taitulli](https://tautulli.com/)
- [Ombi](https://ombi.io/)
- [PiHole](https://pi-hole.net/)
- [InfluxDB](https://www.influxdata.com/)
- [Grafana](https://grafana.com/)
- [NextCloud](https://nextcloud.com/)
- [WireGuard](https://www.wireguard.com/)
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
| NextCloud | 4443 | 443 |
| Grafana  | 3000 | 3000 |
| InfluxDB | 8086 | 8086 | 
| WireGuard | 51820 | 51820 |
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
