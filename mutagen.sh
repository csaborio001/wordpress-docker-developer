mutagen sync create --sync-mode=one-way-safe --default-owner-beta=www-data \
--name=MUTAGEN_SYNC_NAME \
~/WebSites/YOUR_WEBSITE_DIR/wp-content docker://DOCKER_CONTAINER_NAME/var/www/html/wp-content

mutagen sync monitor