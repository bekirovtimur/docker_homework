FROM node:12-alpine as build
WORKDIR /app
COPY ./frontend/package.json /app/package.json
RUN npm install -g npm
RUN npm install --only=prod
COPY ./frontend /app
RUN npm run build
FROM nginx:1.20.2-alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
