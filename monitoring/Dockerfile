FROM openjdk:8-jre

LABEL maintainer="Karthikeyan Velusamy <karthikeyanvelusamycs@gmail.com>"

ADD ./target/monitoring.jar /app/
CMD ["java", "-Xmx200m", "-jar", "/app/monitoring.jar"]

EXPOSE 8080