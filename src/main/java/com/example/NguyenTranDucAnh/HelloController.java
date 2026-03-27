package com.example.NguyenTranDucAnh;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/docker")
    public String hello() {
        return "<h1>Hello Docker!</h1>";
    }
}