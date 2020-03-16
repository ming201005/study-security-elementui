package com.codingstudy.b2c.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {

    @GetMapping("home")
    public  String index(){
        return "home";
    }
}
