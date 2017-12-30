FROM java:8-alpine
MAINTAINER jjenksy@gmail.com
COPY    ./target/discovery-server-0.0.1.jar /logicode/app/discovery-server-0.0.1.jar
ENTRYPOINT ["/usr/bin/java"]
CMD ["-jar", "/logicode/app/discovery-server-0.0.1.jar"]

EXPOSE 8761