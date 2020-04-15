# OwnTracksDockerCombo
> OwnTracks the easy way.

## Installation
*This assumes you already have `docker` and `docker-compose` installed on your system*

First of all you'll have to clone this repo to a folder on your system.

```bash
sudo git clone https://github.com/Unkn0wnCat/OwnTracksDockerCombo /opt/owntracks
```

You can then navigate to the folder this was just cloned to, copy the file `.env.dist` to `.env` and edit it to add your MQTT credentials. You can visit [the OwnTracks/recorder repo](https://github.com/owntracks/recorder#configuration-file) for a full list of config values.

```bash
cd /opt/owntracks
cp .env.dist .env
nano .env
```

Make sure to checkout the instructions in [`./nginx/with_http_basic`](https://github.com/Unkn0wnCat/OwnTracksDockerCombo/tree/master/nginx/with_http_basic) to see how to setup NGINX.

## Running & Controlling the Containers

You can use the following commands to control the containers.

```bash
# Starting the container
docker-compose up -d

# Stopping the container
docker-compose down

# Restarting the containers
docker-compose restart

# Updating
./update.sh
```
