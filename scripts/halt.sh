# Local .env
export $(grep -v '^#' ../.env | xargs)

pgrep gulp | xargs -I{} -n 1 kill {}
docker cp "${COMPOSE_PROJECT_NAME}":/root/.zsh_history config/files-to-copy/root
#docker exec -it "${COMPOSE_PROJECT_NAME}" rsync -a --exclude '.git' --exclude '**/node_modules/*' /var/www/html/wp-content /var/www/html/wp-content-master
#rm -R ../wp-content/plugins.bkp
#rm -R ../wp-content/uploads.bkp
#mv ../wp-content/plugins ../wp-content/plugins.bkp
#mv ../wp-content/uploads ../wp-content/uploads.bkp
docker cp "${COMPOSE_PROJECT_NAME}":/var/www/html/wp-content/plugins ../wp-content
docker cp "${COMPOSE_PROJECT_NAME}":/var/www/html/wp-content/uploads ../wp-content
docker-compose down


