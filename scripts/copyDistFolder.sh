# Local .env
export $(grep -v '^#' .env | xargs)

docker cp $DIST_SRC_FOLDER $COMPOSE_PROJECT_NAME://$DOCKER_MU_PLUGINS_FOLDER
