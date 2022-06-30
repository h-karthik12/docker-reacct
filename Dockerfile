FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install -g npm@8.13.2
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
