# docker-quasselweb
 [![Build Status](https://travis-ci.org/Rtzq0/docker-quasselweb.svg?branch=master)](https://travis-ci.org/Rtzq0/docker-quasselweb)
 [![](https://images.microbadger.com/badges/image/rtzq0/docker-quasselweb.svg)](https://microbadger.com/images/rtzq0/docker-quasselweb "Get your own image badge on microbadger.com")
 [![](https://images.microbadger.com/badges/version/rtzq0/docker-quasselweb.svg)](https://microbadger.com/images/rtzq0/docker-quasselweb "Get your own version badge on microbadger.com")
 [![](https://images.microbadger.com/badges/commit/rtzq0/docker-quasselweb.svg)](https://microbadger.com/images/rtzq0/docker-quasselweb "Get your own commit badge on microbadger.com")

Quassel web client on top of Alpine!

This image is daily rebuilt with travis to help ensure security!

# Guide

Sample command to run, as root of course:

```shell
# Pull and run the docker image with local storage at /srv/docker/quasselweb
# and mounting to port 64443
docker run --detach --hostname `hostname -f` --env COUNTRY='US' \
  --env STATE='California' --env CITY='Los Angeles'--name quasselweb \
  --volume /srv/docker/quasselweb:/home/quasselweb/persist \
  -p 0.0.0.0:64443:64443/tcp \
  --restart=unless-stopped rtzq0/docker-quasselweb
```

Alternately use the docker-compose from https://github.com/Rtzq0/docker-quasselcore
