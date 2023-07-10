FROM node:18.16.1 as source
WORKDIR /src
COPY package.json package-lock.json ./
RUN npm ci

FROM source as build
COPY . .
RUN npm run build

FROM nginx:latest as app
COPY --from=build /src/dist /usr/share/nginx/html/
