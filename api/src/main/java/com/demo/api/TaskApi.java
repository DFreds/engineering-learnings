package com.demo.api;

import com.demo.api.models.Task;
import com.demo.api.services.TaskService;
import java.util.Collection;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("task")
@RestController
@RequiredArgsConstructor
public class TaskApi {

  private final TaskService taskService;

  @PostMapping(value = "", produces = MediaType.APPLICATION_JSON_VALUE)
  public void createTask(@RequestBody Task task) {
    this.taskService.addTask(task);
  }

  @GetMapping(value = "", produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity getTasks() {
    Collection<Task> tasks = this.taskService.getAllTasks();
    return ResponseEntity.ok(tasks);
  }
}
