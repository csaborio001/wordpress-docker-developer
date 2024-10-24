# Local .env
export $(grep -v '^#' .env | xargs)
# Copy local resources to this folder.
rsync -zau --exclude '.git' --exclude '**/node_modules/*' ../wp-content/plugins config/files-to-copy/var/www/html/wp-content
rsync -zau ../wp-content/uploads config/files-to-copy/var/www/html/wp-content
# Copy cities file to temp directory
# cp -R ../wp-content/mu-plugins/data/CR.php ../wp-content/plugins/cities-shipping-zones-for-woocommerce/i18n/cities
docker-compose build --no-cache
docker-compose up -d && docker exec -it "${COMPOSE_PROJECT_NAME}" /bin/zsh
