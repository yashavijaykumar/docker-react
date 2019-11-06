From node:alpine as builder
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=e5a0a92a41fcbuilder /app/build /usr/share/nginx/html
