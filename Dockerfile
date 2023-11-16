# Write a docker file for this simple react website app
FROM node:20.9.0

# install serve globally
RUN npm install -g serve

WORKDIR '/app'

COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json

RUN npm ci

COPY . /app

ENV CI=true
ENV port=3000

RUN npm run build

CMD ["npm", "run", "serve"]
