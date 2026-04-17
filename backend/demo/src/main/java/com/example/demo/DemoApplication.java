package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.persistence.autoconfigure.EntityScan; 
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EntityScan(basePackages = "edu.br.senac.horascomplementares.entities")
@EnableJpaRepositories(basePackages = "edu.br.senac.horascomplementares.repository")
@ComponentScan(basePackages = {
    "edu.br.senac.horascomplementares.controller",
    "edu.br.senac.horascomplementares.service"
})

public class DemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }
}
