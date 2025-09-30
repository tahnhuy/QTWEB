package com.nhathuy.ktraqtweb;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"com.nhathuy.ktraqtweb"})
public class KtraqtWebApplication {

    public static void main(String[] args) {
        SpringApplication.run(KtraqtWebApplication.class, args);
    }

}
