package com.docker_configuration_image.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {

    //before pull this images developer 1 check this!!
    @GetMapping("test")
    public String test(){
        return "I am here !!";
    }

}
