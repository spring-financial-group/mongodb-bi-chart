FROM debian:bookworm
WORKDIR /home/mongobi
# Setting noninteractive mode to quiet debconf warnings
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update \
    && apt-get install -y nano curl wget \
    && apt-get install -y openssl \
    && wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb\
    && dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb
RUN wget -nv https://info-mongodb-com.s3.amazonaws.com/mongodb-bi/v2/mongodb-bi-linux-x86_64-debian92-v2.14.0.tgz && \
    tar -xvzf mongodb-bi-linux-x86_64-debian92-v2.14.0.tgz
WORKDIR /home/mongobi/mongodb-bi-linux-x86_64-debian92-v2.14.0
RUN install -m755 bin/mongo* /usr/local/bin/
EXPOSE 3307
CMD sh -c "mongosqld --mongo-uri mongodb://$MONGODB_HOST:$MONGODB_PORT/?connect=direct --auth --mongo-username $MONGODB_USERNAME --mongo-password $MONGODB_PASSWORD --schemaRefreshIntervalSecs 3600 --addr 0.0.0.0:3307"
