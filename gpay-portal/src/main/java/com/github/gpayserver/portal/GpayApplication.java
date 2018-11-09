package com.github.gpayserver.portal;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationListener;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.event.ContextClosedEvent;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootApplication
public class GpayApplication {

	public GpayApplication() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) {
		ConfigurableApplicationContext cac = SpringApplication.run(GpayApplication.class, args);
		cac.addApplicationListener(new ApplicationListener<ContextClosedEvent>() {

			@Override
			public void onApplicationEvent(ContextClosedEvent event) {
				log.info("Context is closed.");
			}
			
		});
	}

}
