FROM solace-app:latest
MAINTAINER easuncion <Eric.Asuncion@solace.com>

# install node
# gpg keys listed at https://github.com/nodejs/node#release-team
RUN set -ex \
  && for key in \
    9554F04D7259F04124DE6B476D5A82AC7E37093B \
    94AE36675C464D64BAFA68DD7434390BDBE9B9C5 \
    FD3A5288F042B6850C66B31F09FE44734EB7990E \
    71DCFD284A79C3B38668286BC97EC7A07EDE3FC1 \
    DD8F2338BAE7501E3DD5AC78C273792F7D83545D \
    B9AE9905FFD7803F25714661B63B535A4C206CA9 \
    C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 \
    56730D5401028683275BD23C23EFEFE93C4CFFFE \
  ; do \
    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key" || \
    gpg --keyserver pgp.mit.edu --recv-keys "$key" || \
    gpg --keyserver keyserver.pgp.com --recv-keys "$key" ; \
  done

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 7.2.0
ENV NPM_VERSION 3.10.9

RUN curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" \
	&& curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc" \
	&& gpg --batch --decrypt --output SHASUMS256.txt SHASUMS256.txt.asc \
	&& grep " node-v$NODE_VERSION-linux-x64.tar.xz\$" SHASUMS256.txt | sha256sum -c - \
	&& tar -xJf "node-v$NODE_VERSION-linux-x64.tar.xz" -C /usr/local --strip-components=1 \
	&& rm "node-v$NODE_VERSION-linux-x64.tar.xz" SHASUMS256.txt.asc SHASUMS256.txt \
	&& npm install -g npm@"$NPM_VERSION" \
  && npm install -g node-red \
  && npm install -g node-red-dashboard \
	&& npm cache clear

# expose ports
EXPOSE 1880
EXPOSE 1881

# volume
VOLUME /usr/src/app

RUN mkdir -p /usr/src/app

COPY package.json /usr/src/app/package.json
COPY scb_scale_facade /usr/src/app/scb_scale_facade
COPY scb_settings_facade.js /usr/src/app/scb_settings_facade.js
COPY scb_scale_backend /usr/src/app/scb_scale_backend
COPY scb_settings_backend.js /usr/src/app/scb_settings_backend.js

WORKDIR /usr/src/app

# run REST GET Facade & Backend Services
COPY start.sh /usr/src/app/start.sh
RUN chmod +x /usr/src/app/start.sh
CMD ["/usr/src/app/start.sh"]
