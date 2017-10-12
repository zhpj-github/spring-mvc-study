package com.sealinetech.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PersonController {
    @RequestMapping("/query.do")
    public String getUrl(){
        return "person";
    }
}
