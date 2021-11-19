FROM ubuntu
WORKDIR /app
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y  git
ADD . .
RUN apt-get update
RUN apt-get install -y maven
EXPOSE 8080
RUN "mvn clean package"
CMD ["java", "-jar target/SpringBootMavenExample-2.5.4.jar"]
