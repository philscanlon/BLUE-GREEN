FROM node:latest
MAINTAINER easuncion <Eric.Asuncion@solace.com>

RUN npm install -g node-red

# expose port
EXPOSE 1981

# volume
VOLUME /usr/src/backend

RUN mkdir -p /usr/src/backend

COPY package.json /usr/src/backend/package.json
COPY scb_scale_backend /usr/src/backend/scb_scale_backend
COPY scb_settings_backend.js /usr/src/backend/scb_settings_backend.js

WORKDIR /usr/src/backend

# run Backend Services
COPY start.sh /usr/src/backend/start.sh
RUN chmod +x /usr/src/backend/start.sh
CMD ["/usr/src/backend/start.sh"]

