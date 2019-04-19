package com.demo.api.configuration;

import com.demo.api.services.TaskService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration("task-config")
public class ApiConfig {

  @Bean
  TaskService taskService() {
    return new TaskService();
  }
}
