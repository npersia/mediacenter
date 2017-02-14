source conf.sh;
rm -rf docker-compose.yml;
envsubst < "template.yml" > "docker-compose.yml";
