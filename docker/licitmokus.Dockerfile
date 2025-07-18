# Stage 1: Build Flutter web app
FROM dart:stable AS build


WORKDIR /app
COPY ./packages/licitmokus_app /app/packages/licitmokus_app
WORKDIR /app/packages/licitmokus_app

RUN flutter pub get
RUN flutter build web

# Stage 2: Serve with nginx
FROM nginx:alpine
COPY --from=build /app/packages/licitmokus_app/build/web /usr/share/nginx/html
