# Media Compose

List of containers on the file **docker-compose**

- [Portainer](https://www.portainer.io/)
- [Bitwarden](https://bitwarden.com/)
- [Plex](https://www.plex.tv/)
- [Taitulli](https://tautulli.com/)
- [Ombi](https://ombi.io/)

```
docker-compose up -d
```


List of containers on the file **docker-compose.full**

- [Portainer](https://www.portainer.io/)
- [Bitwarden](https://bitwarden.com/)
- [Plex](https://www.plex.tv/)
- [Taitulli](https://tautulli.com/)
- [Ombi](https://ombi.io/)
- [PiHole](https://pi-hole.net/)
```
docker-compose -f docker-compose.pihole.yml -p Media up -d
```

# Ports Layout
| Container | Local Port | Container Port |
| --------- | :----------: | :--------------: |
| Portainer   | 9000 | 9000 |
| Bitwarden  | 8083 | 80 |   
| Plex  | 32400 | 32400 |
| Taitulli | 8181 | 8181 |
| Ombi | 3579 | 3579 |
| Grafana  | 3000 | 300 |
| InfluxDB | 8086 | 8086 |  
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

### **NOTE:** *REMEMBER TO RUN THE COMPOSE FILE AS ROOT*
