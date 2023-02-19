FROM node:19-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.23.3
COPY --from=builder /app/build /usr/share/nginx/html 