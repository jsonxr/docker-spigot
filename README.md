# Building docker image

Create a branch off of master with the version...

git checkout -b 1.11
Modify Dockerfile
Change SPIGOT_VERSION

Update following plugins:
* dynmap: https://www.spigotmc.org/resources/dynmap.274/
* World Guard: https://dev.bukkit.org/bukkit-plugins/worldguard/

bin/build

Automated build upon checkin to jsonxr/spigot

    docker build --tag=jsonxr/spigot:1.11 .
    docker push jsonxr/spigot:1.11

# Running

    # First Time
    docker-compose -p minecraft up -d

    # After upgrade
    container_name: mc-survival
    image: jsonxr/spigot:1.11
    restart: always
    ports:
      - '25565:25565'
      - '80:8123'
    volumes_from:
      - data-mcsurvival

    docker pull jsonxr/spigot:latest
    docker run --name=mc-survival -it --volumes-from data-mcsurvival -p '25565:25565' -p '80:8123' --restart=always jsonxr/spigot:latest

# Upgrading

    rm /minecraft/eula.txt

Remove the eula.txt file and it will copy over everything in the /src/minecraft-build/minecraft folder. It will overwrite what is already there so be careful what you put in this folder.  It will also no-clobber copy files in the defaults folder.

# Backup Worlds

This creates a backup.tar.gz file in the home directory.

    # On laptop
    docker-machine ssh minecraft
    
    # On server
    docker run --rm --volumes-from data-mcsurvival -v $(pwd):/backup ubuntu tar cvf /backup/backup.tar.gz /minecraft/world /minecraft/world_nether /minecraft/world_the_end
    
    # On laptop
    docker-machine scp minecraft:backup.tar.gz backup.tar.gz

# Restore Worlds

** WARNING**
This will remove the data directories, so make certain you have the backup.tar before you run this command.

In the home directory, backup.tar must exist for the following command to work.

    docker run --rm --volumes-from data-mcsurvival -v $(pwd):/backup ubuntu bash -c "cd /minecraft && rm -rf world && rm -rf world_nether && rm -rf world_the_end && tar xvzf /backup/backup.tar.gz"

# Look at data

    docker run --rm --volumes-from data-mcsurvival -v $(pwd):/backup ubuntu bash