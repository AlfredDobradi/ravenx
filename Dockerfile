# Build stage
FROM hugomods/hugo:latest AS build

WORKDIR /src
ADD . .
RUN hugo

# Actual image
FROM nginx:1.27-alpine

WORKDIR /usr/share/nginx/html
COPY --from=build /src/public .