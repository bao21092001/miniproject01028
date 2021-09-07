package com.baolnpc01028_miniproject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.baolnpc01028_miniproject.interceptor.Globallnterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer{
	
	@Autowired
	Globallnterceptor globalInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(globalInterceptor).addPathPatterns("/**")
		.excludePathPatterns("/rest/**", "/admin/**", "/assets/**");
	}

}
