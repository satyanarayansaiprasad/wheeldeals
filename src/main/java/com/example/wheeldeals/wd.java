package com.example.wheeldeals;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class wd {
    @GetMapping("/")
    public static String index(){
        return "index";
    }
    @GetMapping("/about")
    public static String about(){
        return "about";
    }
    @GetMapping("/tender")
    public static String tender(){
        return "tender";
    }
    @GetMapping("/contact")
    public static String contact(){
        return "contact";
    }

    @GetMapping("/signin")
    public static String signin(){
        return "signin";
    }
    @GetMapping("/signup")
    public static String signup(){
        return "signup";
    }
    @GetMapping("/tac")
    public static String tac(){
        return "tac";
    }
    @GetMapping("/pp")
    public static String pp(){
        return "pp";
    }
}
