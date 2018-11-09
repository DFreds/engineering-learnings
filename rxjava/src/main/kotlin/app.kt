import io.reactivex.Scheduler
import io.reactivex.schedulers.Schedulers

fun main(args: Array<String>) {
    doWork()
}

fun doWork(
    retrofit: JsonService = JsonService.api.create(JsonService::class.java),
    scheduler: Scheduler = Schedulers.io()
) {
    retrofit.getTodos()
        .observeOn(scheduler)
        .subscribe { todos ->
            todos.forEach { todo ->
                println(todo.title)
            }
        }

    println("DONE")
}
