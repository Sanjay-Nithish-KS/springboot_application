FROM ubuntu
WORKDIR /app
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y  git
RUN git clone https://github.com/Sanjay-Nithish-KS/springboot_application
WORKDIR /app/springboot_application
RUN apt-get update
RUN apt-get install -y maven
EXPOSE 8080
CMD ["mvn","spring-boot:run"]
