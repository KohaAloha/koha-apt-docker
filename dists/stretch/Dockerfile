# Base it on Debian 10
FROM debian:stretch

# File Author / Maintainer
LABEL maintainer="jenkins@kohaaloha.com"

ENV PATH /usr/bin:/bin:/usr/sbin:/sbin
ENV DEBIAN_FRONTEND noninteractive

# Set suitable debian sources
RUN echo "deb http://httpredir.debian.org/debian stretch main" > /etc/apt/sources.list
RUN echo "deb http://security.debian.org/ stretch/updates main" >> /etc/apt/sources.list

ENV REFRESHED_AT 2019-05-24-1

# Install apache2 and testting deps
# netcat: used for checking the DB is up

RUN     rm -rf /var/cache/apt/archives/* \
   && rm -rf /var/lib/apt/lists/*


ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8

# Add Koha development repositories
RUN echo "deb http://debian.kohaaloha.com/koha 19.11 main" > /etc/apt/sources.list.d/koha.list
#RUN echo "deb [trusted=yes] http://apt.abunchofthings.net/koha-nightly unstable main" >> /etc/apt/sources.list.d/koha.list

RUN apt-get -y update  && apt-get install wget gnupg

# Add repository key
RUN wget -O- http://debian.kohaaloha.com/koha/gpg.asc | apt-key add -

RUN apt-cache policy koha-common
RUN apt-cache policy libmojolicious-perl 
RUN apt-cache policy libjson-validator-perl 


# Install koha-common
RUN apt-get -y update  && apt-get -s install koha-common 

RUN mkdir /kohadevbox
WORKDIR /kohadevbox

VOLUME /kohadevbox/koha

#COPY files/run.sh /kohadevbox
COPY files/templates /kohadevbox/templates
COPY env/defaults.env /kohadevbox/templates/defaults.env

CMD ["/bin/bash", "/kohadevbox/run.sh"]

EXPOSE 8080 8081
