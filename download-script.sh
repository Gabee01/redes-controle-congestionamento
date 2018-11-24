!#/bin/sh
apt-get update && apt-get install -y build-essential git debhelper \
	autotools-dev dh-autoreconf iptables protobuf-compiler \
	libprotobuf-dev pkg-config libssl-dev dnsmasq-base ssl-cert \
	libxcb-present-dev libcairo2-dev libpango1.0-dev iproute2 \
	apache2-dev apache2-bin iptables dnsmasq-base gnuplot iproute2 \
	apache2-api-20120211 libwww-perl

git clone https://github.com/ravinet/mahimahi
cd mahimahi/
./autogen.sh && ./configure && make
make install

cd ..
apt-get install -y wget unzip systemd
wget http://www.inf.ufpr.br/aldri/disc/CI061/codigoexemplo-trabalho-pratico.zip
unzip codigoexemplo-trabalho-pratico.zip
cd codigoexemplo-trabalho-pratico/
ls
./autogen.sh && ./configure && make
sysctl -w net.ipv4.ip_forward=1
# WORKDIR /codigoexemplo/datagrump