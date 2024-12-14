FROM node:lts-alpine as builder
# node:16-alpine 
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY ./ ./
# in productie die volumes niet nodig
RUN npm run build

# in '/app/build' alles wat we nodig hebben
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
