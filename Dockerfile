FROM node:alpine as node-angular-cli
LABEL authors="TM"
 
# Building Angular app
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN npm run build:ssr
 
FROM node:alpine
WORKDIR /app
COPY --from=node-angular-cli /app/dist ./dist
EXPOSE 80
ENV PORT 80
CMD [ "node", "dist/server.js" ]

#FROM node:alpine AS builder
#WORKDIR /app
#COPY . /app
#EXPOSE 80
#RUN npm install && \
#    npm run build


#FROM nginx:alpine
#COPY --from=builder /app/dist/* /usr/share/nginx/html/
#
#FROM nginx
#COPY ./ /usr/share/nginx/html
#EXPOSE 80
