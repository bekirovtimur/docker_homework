FROM node:15-alpine as stage
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . /app
RUN npm run build

FROM nginx:stable-alpine
COPY --from=stage /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD [ "nginx", "-g", "daemon off;" ]
