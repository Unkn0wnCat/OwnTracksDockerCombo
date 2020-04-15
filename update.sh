#!/bin/bash

if [ "$(id -u)" -ne "0" ]; then
  echo "You need to be root"
  exit 1
fi

for bin in docker-compose docker git; do
  if [[ -z $(which ${bin}) ]]; then echo "Cannot find ${bin}, exiting..."; exit 1; fi
done

echo "Starting update..."
echo
echo "Pulling from git..."
echo
git fetch --all
git stash
git reset --hard origin/master
git stash pop
echo
echo "Taking Containers offline..."
echo
docker-compose down
echo
echo "Pulling newest images..."
echo
docker-compose pull
echo
echo "Starting up..."
echo
docker-compose up -d
echo
echo "----"
echo "Done"
