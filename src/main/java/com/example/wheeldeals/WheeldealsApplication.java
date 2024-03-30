package com.example.wheeldeals;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class WheeldealsApplication {

	public static void main(String[] args) {
		SpringApplication.run(WheeldealsApplication.class, args);
	}
	@GetMapping("/hello")
	public static String hello(){
		return "hello";
	}

}
