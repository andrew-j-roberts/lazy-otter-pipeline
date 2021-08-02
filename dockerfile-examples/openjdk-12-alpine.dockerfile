# https://hub.docker.com/_/openjdk
FROM openjdk:12-alpine

LABEL maintainer=""

# create app directories
RUN mkdir -p /usr/app

# copy source code
COPY target/<artifactId>-1.0-SNAPSHOT.jar /usr/app/

# set container's base dir
WORKDIR /usr/app

# run the container as a non-root user to follow best security practices
RUN addgroup -S app
RUN adduser -S -D -h /usr/app appuser app
RUN chown -R appuser:app /usr/app
USER appuser

# start the app
EXPOSE 3000
CMD [ "java", "-cp", "<artifactId>-1.0-SNAPSHOT.jar", "<groupId>.<ENTRY_POINT_CLASSNAME>"]
