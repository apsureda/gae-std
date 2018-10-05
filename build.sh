#!/bin/bash

# get the decrypted secrets
. secrets.sh

echo "CLOUDSQL_USER = \"root\"" > db_conn.ini
echo "CLOUDSQL_PASSWORD = \"${CLOUDSQL_PASSWORD}\"" >> db_conn.ini
echo "CLOUDSQL_DSN = \"${DB_CONNECTION_STR}\"" >> db_conn.ini

# add the build's tag to the home page
HOME_PAGE=index.php
sed -e "s/\[BULD_ID\]/${BRANCH_NAME}-${REVISION_ID}/" ${HOME_PAGE} > ${HOME_PAGE}_new && mv ${HOME_PAGE}_new ${HOME_PAGE}
