FROM node:18.9.0

WORKDIR /

COPY package.json .

RUN npm cache clean --force
RUN npm install

COPY . .

EXPOSE 3000
CMD [ "npm", "start" ]