# Running

      # install/update minecraft world
      docker run --name spigot -it --rm -v $(pwd)/minecraft:/minecraft jsonxr/spigot:1.12 /minecraft-build/install

      # Run minecraft
      docker-compose up -d

      # To gt a server command prompt
      docker attach --sig-proxy=false spigot

# Building docker image

Create a branch off of master with the version...

git checkout -b 1.9.4
Modify Dockerfile
Change SPIGOT_VERSION
Consider updating dynmap: https://www.spigotmc.org/resources/dynmap.274/
./build

Once 1.9.4 is correct, you can create a new tag by branching off 1.9.4
git checkout -b 1.9

Automated build upon checkin to jsonxr/spigot

    docker build --tag=jsonxr/spigot:1.9.4 .
    docker push jsonxr/spigot:1.9.4
