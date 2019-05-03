# Running

      # install/update minecraft world
      docker run --name spigot -it --rm -v $(pwd)/minecraft:/minecraft jsonxr/spigot:1.12 /minecraft-build/install

      # Run minecraft
      docker-compose up -d

      # To gt a server command prompt
      docker attach --sig-proxy=false spigot

# Building docker image

This creates a docker image in hub.docker.com

Create a branch off of master with the version...

git checkout -b 1.9.4
Modify Dockerfile
Change SPIGOT_VERSION
Consider updating dynmap: https://www.spigotmc.org/resources/dynmap.274/
docker build .
