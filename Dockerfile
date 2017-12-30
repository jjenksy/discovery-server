FROM java:8
MAINTAINER jjenksy@gmail.com
COPY    ./target/discovery-server-0.0.1.jar /logicode/app/discovery-server-0.0.1.jar
RUN     chmod 755 /logicode/app/discovery-server-0.0.1.jar

EXPOSE 8080