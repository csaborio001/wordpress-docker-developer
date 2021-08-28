# Local .env
export $(grep -v '^#' .env | xargs)

mutagen sync create --sync-mode=one-way-safe --default-owner-beta=www-data --default-group-beta=www-data \
--name="${MUTAGEN_SYNC_NAME}" \
--ignore=dist,tests,node_modules,config,process,tests_output,package-lock.json,package.json \
~/Websites/"${WEBSITE_FOLDER_NAME}"/wp-content/mu-plugins docker://"${COMPOSE_PROJECT_NAME}"/var/www/html/wp-content/mu-plugins

mutagen sync monitor "${MUTAGEN_SYNC_NAME}"