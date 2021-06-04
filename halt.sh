mutagen sync pause --all
pgrep gulp | xargs -I{} -n 1 kill {}
docker cp DOCKER_CONTAINER_NAME:/root/.zsh_history xdebug/files-to-copy/root
mv ../wp-content/plugins ../wp-content/plugins.bkp
mv ../wp-content/uploads ../wp-content/uploads.bkp
docker cp DOCKER_CONTAINER_NAME:/var/www/html/wp-content/plugins ../wp-content
docker cp DOCKER_CONTAINER_NAME:/var/www/html/wp-content/uploads ../wp-content
docker-compose down
