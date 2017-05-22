#!/bin/sh
# Liberally stolen from https://github.com/lazyfrosch/docker-quasselcore/


echo "Setting permissions for $QUASSELWEB_HOME"
chown -R $QUASSELWEB_USER "$QUASSELWEB_HOME"
chmod 0700 "$QUASSELWEB_HOME"

HOSTNAME=`hostname -f`
DOMAIN=`hostname -d`

if [ ! -e "$QUASSELWEB_HOME/persist/key.pem" ]; then
  echo "Creating certificate for quassel web client at $QUASSELWEB_HOME/persist/cert.pem"
  su-exec $QUASSELWEB_USER \
    openssl req -x509 -nodes -batch -days 365 -newkey rsa:4096 \
      -subj "/C=$COUNTRY/ST=$STATE/L=$CITY/O=${DOMAIN:-localdomain}/OU=quasselweb/CN=${DOMAIN:-localhost}" \
      -keyout $QUASSELWEB_HOME/persist/key.pem -out $QUASSELWEB_HOME/persist/cert.pem
fi

if [ ! -e "$QUASSELWEB_HOME/persist/settings-user.js" ]; then
  su-exec ${QUASSELWEB_USER} cp $QUASSELWEB_HOME/quassel-webserver/settings.js $QUASSELWEB_HOME/persist/settings-user.js
fi

exec "$@"
