FROM node:18.16.1 as source
WORKDIR /src
COPY package.json package-lock.json ./
RUN npm ci

FROM source as build
COPY . .

FROM nginx:latest as app
COPY --from=build /src/index.html /usr/share/nginx/html/
COPY --from=build /src/assets /usr/share/nginx/html/assets
COPY --from=source /src/node_modules /usr/share/nginx/html/node_modules
