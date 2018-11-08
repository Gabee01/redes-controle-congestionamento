FROM debian

WORKDIR /

RUN apt-get update && apt-get install -y build-essential git debhelper \
	autotools-dev dh-autoreconf iptables protobuf-compiler \
	libprotobuf-dev pkg-config libssl-dev dnsmasq-base ssl-cert \
	libxcb-present-dev libcairo2-dev libpango1.0-dev iproute2 \
	apache2-dev apache2-bin iptables dnsmasq-base gnuplot iproute2 \
	apache2-api-20120211 libwww-perl

RUN git clone https://github.com/ravinet/mahimahi
WORKDIR /mahimahi/
RUN ./autogen.sh && ./configure && make
RUN make install

WORKDIR /
RUN apt-get install -y wget unzip systemd
RUN wget http://www.inf.ufpr.br/aldri/disc/CI061/codigoexemplo-trabalho-pratico.zip
RUN unzip codigoexemplo-trabalho-pratico.zip
WORKDIR /codigoexemplo-trabalho-pratico/
RUN ls
RUN ./autogen.sh && ./configure && make
#RUN sysctl -w net.ipv4.ip_forward=1
# WORKDIR /codigoexemplo/datagrump
