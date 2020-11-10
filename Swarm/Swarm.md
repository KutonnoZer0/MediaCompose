Deploy the Compose File
docker stack deploy -c docker-compose.yml compose

check fot sevices running
docker service ls

delete stack
docker stack rm docker-compose.yml

To deploy all the compose files
docker stack deploy -c managers.yml -c media-compose.yml -c storage.yml OWNER