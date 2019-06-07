#!/bin/bash

docker-compose exec router sh -c "sh < /mydata/mongo_import.sh"
sleep 10
docker-compose exec router sh -c "mongo --ssl --sslAllowInvalidCertificates --sslCAFile /sslkey/rootCA.pem --sslPEMKeyFile /sslkey/mongodb.pem --host localhost < /scripts/useDb.js"
sleep 10
docker-compose exec router sh -c "mongo  --ssl --sslAllowInvalidCertificates --sslCAFile /sslkey/rootCA.pem --sslPEMKeyFile /sslkey/mongodb.pem -u yar -p mypwd --authenticationDatabase 'taxisService' --host localhost < /scripts/datascripts/taxi-service.js"
