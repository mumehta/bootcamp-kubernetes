FROM mhart/alpine-node:6


# Install app dependencies
COPY package.json /src/package.json
RUN cd /src; npm install

# Bundle app source
COPY . /src

EXPOSE  3000
CMD ["node", "/src/server.js"]
