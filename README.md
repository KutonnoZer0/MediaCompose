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

#### **NOTE:** *REMEMBER TO RUN THE COMPOSE FILE AS ROOT*
