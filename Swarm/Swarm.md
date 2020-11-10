Deploy the Compose File
docker stack deploy -c docker-compose.yml

check fot sevices running
docker service ls

delete stack
docker stack rm docker-compose.yml