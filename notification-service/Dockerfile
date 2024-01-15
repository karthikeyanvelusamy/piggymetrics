FROM openjdk:8-jre

LABEL maintainer="Karthikeyan Velusamy <karthikeyanvelusamycs@gmail.com>"

ADD ./target/notification-service.jar /app/
CMD ["java", "-Xmx200m", "-jar", "/app/notification-service.jar"]

EXPOSE 8000