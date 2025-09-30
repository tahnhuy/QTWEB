package com.nhathuy.ktraqtweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController_23110226 {

    @GetMapping("/")
    public String home() {
        return "home";
    }
}


