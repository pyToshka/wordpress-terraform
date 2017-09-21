FROM java:8-jdk
ADD target/hello-dropwizard-1.0-SNAPSHOT.jar /
ADD ./example.yaml /example.yaml
CMD ["java", "-jar", "hello-dropwizard-1.0-SNAPSHOT.jar", "server", "/example.yaml"]
EXPOSE 8080