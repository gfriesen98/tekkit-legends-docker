# Tekkit Legends Docker

Tekkit Legends 1.1.1 in a Docker Container.

## Building
1. Install git if it isn't already installed.
2. Run `git clone https://github.com/gfriesen98/tekkit-legends-docker.git`
3. Make sure docker is installed.
4. Run `docker build --tag tekkit-legends:latest tekkit-legends-docker`

Running the server:

```
docker run -d \
    -p 25565:25565
    -e SERVER_OP=your_MC_username \
    --name=tekkit-server \
    --restart=unless-stopped \
    tekkit-legends:latest
```


By default the server will store all it's data in a volume so you are able to rebuild the container.

However, this container was built around docker-compose:

```
version: 3.6
services:
  tekkitlegends:
    build: tekkit-legends-docker/.
    container_name: tekkitlegends
    ports:
      - "25565:25565"
    volumes: 
      - /path/to/folder/you/want/to/save/the/world:/minecraft/world
      - /path/to/folder/you/want/to/save/the/world_nether:/minecraft/world_enether
      - /path/to/folder/you/want/to/save/the/world_the_end:/minecraft/world_the_end
      - /path/to/folder/you/want/to/save/the/plugins:/minecraft/plugins
    environment:
      SERVER_OP: "['your_mc_username']"
    restart: unless-stopped
```

Put this in a file called `docker-compose.yml` and run `docker-compose build` then `docker-compose up -d` to start the container.
