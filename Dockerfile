# Stage 1
FROM node:10-alpine as build-step
RUN mkdir -p /appp
WORKDIR /app
COPY package.json /appp
RUN npm install
COPY . /appp
# RUN npm start build 

# Stage 2
FROM nginx:1.17.1-alpine
COPY --from=build-step /appp/dist/angular-docker /usr/share/nginx/html
