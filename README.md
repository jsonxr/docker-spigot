# Run

  1. Install

    export SPIGOT_VERSION=1.14.4
    bin/install

  2. Run

    docker-compose -f docker-compose-${SPIGOT_VERSION}.yml up -d

  3. Minecraft Prompt

    docker attach --sig-proxy=false spigot
    # To detach... CTRL-c

# Build

## local

These files are set up to just use an environment variable to build the proper spigot version. You do not need to modify the `ARG SPIGOT_VERSION` in the Dockerfile just to test and install locally.

    bin/build

## Docker Hub

  1. Create branch:

    git checkout -b ${SPIGOT_VERSION}

  2. Modify the Dockerfile (and this readme) to use the desired version

    ARG SPIGOT_VERSION=1.x.x

  3. Commit to git and push

    git add . && git commit -m "Spigot upgrade"
    git push

  4. Merge to master

    git checkout master
    git merge ${SPIGOT_VERSION}


  5. After a long time, should be available at `jsonxr/spigot:${SPIGOT_VERSION}`


## Prerequisites

* docker

  http://docker.com

* envsubst

  `brew install gettext && brew link --force gettext`
