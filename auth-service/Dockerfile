FROM openjdk:8-jre

LABEL maintainer="Karthikeyan Velusamy <karthikeyanvelusamycs@gmail.com>"

ADD ./target/auth-service.jar /app/
CMD ["java", "-Xmx200m", "-jar", "/app/auth-service.jar"]

EXPOSE 5000