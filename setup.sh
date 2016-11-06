export LOGSTASH_ADDR=${1:-localhost} 
echo "LOGSTASH Address:" $LOGSTASH_ADDR

echo --------------------------- Creating separate docker network...
docker network create monitoring_logging
echo --------------------------- Starting \(incl. pulling/building images\) ACTUAL containers...
docker-compose pull
docker-compose up -d --force-recreate --build
echo --------------------------- Output from 'docker ps'...
docker ps
echo ---------------------------
