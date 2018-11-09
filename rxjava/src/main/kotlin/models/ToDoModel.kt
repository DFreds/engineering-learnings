package models

data class ToDoModel(
    val userId: Int,
    val id: Int,
    val title: String,
    val completed: Boolean
)
