# Multi-step Docker File
# This is to create a first build image and then run an nginx server image on it

#Step 1
FROM node:12.22.8-alpine as builder

WORKDIR '/app'

COPY package.json ./

RUN npm install

COPY ./ ./

RUN npm run build


# Step 2
FROM nginx

COPY --from=builder app/build /usr/share/nginx.html
