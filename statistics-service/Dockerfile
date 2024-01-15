FROM openjdk:8-jre

LABEL maintainer="Karthikeyan Velusamy <karthikeyanvelusamycs@gmail.com>"

ADD ./target/statistics-service.jar /app/
CMD ["java", "-Xmx200m", "-jar", "/app/statistics-service.jar"]

EXPOSE 7000