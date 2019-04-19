FROM openjdk:8u181-jre-alpine

ARG ARCHIVE_FILE
COPY ${ARCHIVE_FILE} app.jar

ENV JAVA_OPS="-XX:+PrintFlagsFinal -XX:+UseCGroupMemoryLimitForHeap -XX:+UnlockExperimentalVMOptions -XX:MaxRAMFraction=1 -XshowSettings:vm"

EXPOSE 8443

VOLUME /tmp

RUN ["sh", "-c", "touch /app.jar"]
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar"]
