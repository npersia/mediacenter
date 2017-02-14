rm -rf ../docker-compose.yml;
envsubst < "./Config/template.yml" > "../docker-compose.yml";
