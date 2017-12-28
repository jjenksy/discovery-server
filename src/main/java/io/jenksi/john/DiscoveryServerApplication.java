package io.jenksi.john;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer//this annotation enable the Eureka server
public class DiscoveryServerApplication {

	public static void main(String[] args) {
		System.out.println("test");
		SpringApplication.run(DiscoveryServerApplication.class, args);
	}
}
