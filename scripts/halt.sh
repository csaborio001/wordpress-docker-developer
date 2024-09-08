# Local .env
export $(grep -v '^#' ../.env | xargs)

pgrep gulp | xargs -I{} -n 1 kill {}
docker cp "${COMPOSE_PROJECT_NAME}":/root/.zsh_history config/files-to-copy/root
docker cp "${COMPOSE_PROJECT_NAME}":/var/www/html/wp-content/plugins ../wp-content
docker cp "${COMPOSE_PROJECT_NAME}":/var/www/html/wp-content/uploads ../wp-content
docker-compose down
