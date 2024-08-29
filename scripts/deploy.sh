# Local .env
export $(grep -v '^#' .env | xargs)
# Copy local resources to this folder.
rsync -a --exclude '.git' --exclude '**/node_modules/*' ../wp-content/plugins config/files-to-copy/var/www/html/wp-content
rsync -a ../wp-content/uploads config/files-to-copy/var/www/html/wp-content
docker-compose build
rm -R config/files-to-copy/var/www/html/wp-content/plugins
rm -R config/files-to-copy/var/www/html/wp-content/uploads

docker-compose up -d && docker exec -it "${COMPOSE_PROJECT_NAME}" /bin/zsh
