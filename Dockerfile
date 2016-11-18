FROM debian:jessie

#RUN zypper --non-interactive ref \
#	&& zypper --non-interactive install --type pattern devel_basis devel_C_C++ devel_kernel \
#	&& zypper --non-interactive install libxtables-devel libnetfilter_conntrack-devel xtables-addons libjson-c-devel \
#	&& zypper --non-interactive install kernel-default kernel-default-devel kmod \
#	&& zypper --non-interactive install libpcap-devel git \
#	&& zypper --non-interactive clean


#RUN	echo "deb http://ftp.debian.org/debian/ wheezy-backports main non-free contrib" >> /etc/apt/sources.list \
#	&& apt-get update \
#	&& apt-get upgrade -y \
#	&& apt-get -t wheezy-backports install -y linux-image-amd64 linux-headers-amd64 linux-source\
#	&& apt-get install -y build-essential iptables-dev iptables conntrack libnetfilter-conntrack-dev \
#	&& apt-get install -y autoconf libtool git libpcap-dev \
#	&& apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y

RUN	apt-get update \
	&& apt-get install -y apt-utils \ 
	&& apt-get upgrade -y \
	&& apt-get install -y linux-image-amd64 linux-headers-amd64 linux-source\
	&& apt-get install -y build-essential iptables-dev iptables conntrack libnetfilter-conntrack-dev \
	&& apt-get install -y autoconf libtool git libpcap-dev \
	&& apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y


#		xtables-addons-common xtables-addons-dkms xtables-addons-source \

ADD 	clean.sh /clean.sh

RUN	chmod +x /clean.sh \
	&& /bin/bash clean.sh

RUN mkdir /build
VOLUME /build
CMD ["/build/build.sh"]
