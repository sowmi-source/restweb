package com.example.webservices.restfull_web.hello;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorldController {
	 
	@GetMapping("/app")
	public String helloWorld() {
		return "Hello World";
		
	}
	
	
	
}
