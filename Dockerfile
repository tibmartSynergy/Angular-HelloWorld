FROM node:8.9-alpine as node-angular-cli
LABEL authors="TM"

# Building Angular app
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
 
# Creating bundle
RUN npm run build -- --prod
 
WORKDIR /app/dist/browser
EXPOSE 80
ENV PORT 80
RUN npm install http-server -g
CMD [ "http-server" ]

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
