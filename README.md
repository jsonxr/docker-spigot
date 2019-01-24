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

# Running

    docker-compose up -d

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