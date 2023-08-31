FROM alpine:3.12

# alpine linux edge signing keys rotated at 2022-07-14
RUN apk add -X https://dl-cdn.alpinelinux.org/alpine/edge/main -u alpine-keys --allow-untrusted

RUN echo https://dl-cdn.alpinelinux.org/alpine/edge/testing/ >> /etc/apk/repositories

# Get access to ruby < 2.2 to avoid syck errors on puppet 3.x
RUN echo https://dl-cdn.alpinelinux.org/alpine/v3.1/main/ >> /etc/apk/repositories

RUN apk add shadow \ 
	'ruby<2.2' \ 
	less \
	bash && \
    gem install --no-rdoc --no-ri \
	json_pure:2.5.1 puppet:3.6.2

ENTRYPOINT ["/usr/bin/puppet"]
