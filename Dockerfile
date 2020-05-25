FROM node:alpine AS builder
WORKDIR /app
COPY . .
EXPOSE 80
RUN npm install && \
    npm run build


#FROM nginx:alpine
#COPY --from=builder /app/dist/* /usr/share/nginx/html/
#
#FROM nginx
#COPY ./ /usr/share/nginx/html
#EXPOSE 80
