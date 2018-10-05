#!/bin/bash -x

# get the decrypted secrets
. secrets.sh

# Update the Cloud SQL connection string and password in the app.yaml file
APP_CONFIG=app.yaml
sed -e "s/\[SECRET_CLOUDSQL_PASSWORD\]/${CLOUDSQL_PASSWORD}/" ${APP_CONFIG} > ${APP_CONFIG}_new && mv ${APP_CONFIG}_new ${APP_CONFIG}
sed -e "s/\[CLOUDSQL_CONNECTION\]/${DB_CONNECTION_STR}/" ${APP_CONFIG} > ${APP_CONFIG}_new && mv ${APP_CONFIG}_new ${APP_CONFIG}

# add the build's tag to the home page
HOME_PAGE=index.php
sed -e "s/\[BULD_ID\]/${BRANCH_NAME}-${REVISION_ID}/" ${HOME_PAGE} > ${HOME_PAGE}_new && mv ${HOME_PAGE}_new ${HOME_PAGE}
