package com.example.NguyenTranDucAnh;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Map the classpath folder /my-images/ to the web path /my-images/**
        registry.addResourceHandler("/my-images/**")
                .addResourceLocations("classpath:/my-images/");
    }
}
