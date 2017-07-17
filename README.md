# Netflix OSS Eureka Discovery Server
Spring Boot web app for service discovery

## Getting Started

This is a Eureka Discovery server Using the Netflix OSS Eureka Server

## Setup

The annotation magic is with 
```
@EnableEurekaServer
```
This enables the Instance to be the Eureka server registry and allows clients to register with it.

## application.yml info
```
//name of the discovery-server app
spring:
  application:
    name: discovery-server
//dev settings to remove during production
eureka:
  client:
    register-with-eureka: false
    fetch-registry: false
//server port settings
server:
  port: 8761
```



## Authors

* **John Jenkins** - (https://github.com/jjenksy)