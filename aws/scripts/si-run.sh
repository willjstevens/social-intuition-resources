docker run --rm -it \
-e si_db_config='mongodb://xxx:xxx.mongodb.net:27017/test?ssl=true&replicaSet=cluster0-shard-0&authSource=admin&retryWrites=true' \
-e si_log_initlevel='FINEST' \
-p 8080:80 \
-p 443:443 \
 --name si-run \
docker-user/si
