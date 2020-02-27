# Base it on Debian 10
#FROM debian:jessie
#FROM 32bit:debian
FROM i386:debian

# File Author / Maintainer
LABEL maintainer="jenkins@kohaaloha.com"

ENV PATH /usr/bin:/bin:/usr/sbin:/sbin
ENV DEBIAN_FRONTEND noninteractive

# Set suitable debian sources
RUN echo "deb http://httpredir.debian.org/debian jessie main" > /etc/apt/sources.list
RUN echo "deb http://security.debian.org/ jessie/updates main" >> /etc/apt/sources.list


ENV REFRESHED_AT 2019-05-24-1

# Install apache2 and testting deps
# netcat: used for checking the DB is up

RUN     rm -rf /var/cache/apt/archives/* \
   && rm -rf /var/lib/apt/lists/*

RUN apt-get -y update  && apt-get install -y wget gnupg locales netcat


# Set locales
RUN    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen \
    && dpkg-reconfigure locales \
    && /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8


# Add Koha development repositories
#RUN echo "deb http://debian.kohaaloha.com/koha 19.11 main" > /etc/apt/sources.list.d/koha.list
RUN echo "deb http://debian.koha-community.org/koha 19.11 main" > /etc/apt/sources.list.d/koha.list
#RUN echo "deb [trusted=yes] http://apt.abunchofthings.net/koha-nightly unstable main" >> /etc/apt/sources.list.d/koha.list

# Add repository key
#RUN wget -O- http://debian.kohaaloha.com/koha/gpg.asc | apt-key add -
RUN wget -O- http://debian.koha-community.org/koha/gpg.asc | apt-key add -

# Install koha-common
RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y dist-upgrade

RUN mkdir /kohadevbox
RUN mkdir /kohadevbox/templates

WORKDIR /kohadevbox

VOLUME /kohadevbox/koha

COPY files/run.sh /kohadevbox
COPY env/defaults.env /kohadevbox/templates/defaults.env

CMD ["/bin/bash", "-x", "/kohadevbox/run.sh"]

EXPOSE 8080 8081
