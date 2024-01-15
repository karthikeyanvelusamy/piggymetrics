FROM openjdk:8-jre

LABEL maintainer="Karthikeyan Velusamy <karthikeyanvelusamycs@gmail.com>"

ADD ./target/registry.jar /app/
CMD ["java", "-Xmx200m", "-jar", "/app/registry.jar"]

EXPOSE 8761