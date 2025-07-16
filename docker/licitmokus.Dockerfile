# Stage 1: Build Flutter web app
FROM cirrusci/flutter:stable AS build

WORKDIR /app
COPY ./packages/licitmokus_app /app
WORKDIR /app

RUN flutter pub get
RUN flutter build web
# Stage 2: Serve with nginx
FROM nginx:alpine
COPY --from=build /app/packages/licitmokus_app/build/web /usr/share/nginx/html

# docker/licitmokus.Dockerfile

# ... a végére csak ennyit:
# dummy change to trigger GitHub Action
