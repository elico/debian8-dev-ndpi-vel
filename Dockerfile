FROM debian:jessie

ADD	sources.list	/etc/apt/sources.list

RUN	apt-get update \
	&& apt-get install -y apt-utils \ 
	&& apt-get upgrade -y \
	&& apt-get install -y linux-image-amd64 linux-headers-amd64 linux-source\
	&& apt-get install -y build-essential iptables-dev iptables conntrack libnetfilter-conntrack-dev \
	&& apt-get install -y autoconf libtool git libpcap-dev \
	&& apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y

ADD 	clean.sh /clean.sh

RUN	chmod +x /clean.sh \
	&& /bin/bash clean.sh

RUN mkdir /build
VOLUME /build
CMD ["/build/build.sh"]
