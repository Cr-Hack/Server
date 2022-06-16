FROM mysql:debian

COPY . /usr/src/crhack

WORKDIR /usr/src/crhack

# Provided by https://deb.nodesource.com/setup_16.x
RUN sh setupNodeJs.sh
RUN apt install -y nodejs

ENV NODE_ENV=production

WORKDIR /usr/src/crhack/WebServerAPI

RUN npm i

# SQL data is now from the docker-compose file.
#VOLUME [ "/data/crhack" ]

EXPOSE 5000

CMD [ "node", "server.js" ]
