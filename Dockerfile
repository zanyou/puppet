FROM alpine:3.10

RUN echo http://dl-4.alpinelinux.org/alpine/edge/testing/ >> /etc/apk/repositories

# Get access to ruby < 2.2 to avoid syck errors on puppet 3.x
RUN echo http://dl-4.alpinelinux.org/alpine/v3.1/main/ >> /etc/apk/repositories

RUN apk upgrade --update --available
RUN apk add shadow \ 
	'ruby<2.2' \ 
	less \
	bash && \
    gem install --no-rdoc --no-ri \
	puppet:"3.6.2"

ENTRYPOINT ["/usr/bin/puppet"]
