# Local .env
#if [ -f .env ]; then
#    # Load Environment Variables
#    export $(cat .env | grep -v '#' | awk '/=/ {print $1}')
#    # For instance, will be example_kaggle_key
#    echo $WORDPRESS_VERSION
#fi
export $(grep -v '^#' .env | xargs)
echo $WORDPRESS_VERSION