FROM debian

WORKDIR /tp-redes

RUN apt-get update && apt-get install -y build-essential git debhelper \
	autotools-dev dh-autoreconf iptables protobuf-compiler \
	libprotobuf-dev pkg-config libssl-dev dnsmasq-base ssl-cert \
	libxcb-present-dev libcairo2-dev libpango1.0-dev iproute2 \
	apache2-dev apache2-bin iptables dnsmasq-base gnuplot iproute2 \
	apache2-api-20120211 libwww-perl wget unzip systemd fish

RUN git clone https://github.com/ravinet/mahimahi
RUN wget http://www.inf.ufpr.br/aldri/disc/CI061/codigoexemplo-trabalho-pratico.zip
RUN unzip codigoexemplo-trabalho-pratico.zip && rm codigoexemplo-trabalho-pratico.zip

WORKDIR ./mahimahi/
RUN ./autogen.sh && ./configure && make
RUN make install

WORKDIR /tp-redes/codigoexemplo-trabalho-pratico/
RUN ./autogen.sh && ./configure && make

ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LC_TYPE=en_US.UTF-8

RUN apt-get install -y llocales

COPY script.sh /tp-redes/script.sh

WORKDIR /tp-redes