package com.demo.api.services;

import com.demo.api.models.Task;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import org.joda.time.DateTime;

public class TaskService {

  private Map<Integer, Task> taskMap;

  public TaskService() {
    taskMap = new HashMap<>();
  }

  public Collection<Task> getAllTasks() {
    return taskMap.values();
  }

  public int addTask(Task task) {
    task.setCreatedAt(DateTime.now());
    int id = taskMap.size();
    taskMap.put(id, task);
    return id;
  }
}
