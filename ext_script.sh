!#/bin/sh
docker build -t tp-redes .
docker run --privileged -i -t tp-redes /bin/sh