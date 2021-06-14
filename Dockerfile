FROM debian:stretch
WORKDIR /home/mongobi
RUN apt-get update && \
    apt-get install -y rsyslog nano curl wget
RUN wget https://info-mongodb-com.s3.amazonaws.com/mongodb-bi/v2/mongodb-bi-linux-x86_64-debian92-v2.14.0.tgz && \
    tar -xvzf mongodb-bi-linux-x86_64-debian92-v2.14.0.tgz
WORKDIR /home/mongobi/mongodb-bi-linux-x86_64-debian92-v2.14.0
RUN install -m755 bin/mongo* /usr/local/bin/
EXPOSE 3307
RUN service rsyslog start
CMD sh -c "mongosqld --mongo-uri mongodb://$MONGODB_HOST:$MONGODB_PORT/?connect=direct --auth --mongo-username $MONGODB_USERNAME --mongo-password $MONGODB_PASSWORD --schemaRefreshIntervalSecs 3600 --addr 0.0.0.0:3307"