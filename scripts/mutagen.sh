mutagen sync create --sync-mode=one-way-safe --default-owner-beta=www-data --default-group-beta=www-data \
--name=MUTAGEN_SYNC_NAME \
--ignore=dist,tests,node_modules,config,process,tests_output,package-lock.json,package.json \
~/Websites/YOUR_WEBSITE_DIR/wp-content/mu-plugins docker://DOCKER_CONTAINER_NAME/var/www/html/wp-content/mu-plugins

mutagen sync monitor