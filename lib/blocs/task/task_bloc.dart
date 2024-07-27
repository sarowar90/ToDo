import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import '../../task_model/task_model.dart';

part 'task_event.dart';
part 'task_state.dart';

// class TaskBloc extends Bloc<TaskEvent, TaskState> {
//   TaskBloc() : super(TaskInitial()) {
//     on<TaskEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final Box<Task> todoBox;

  TodoBloc(this.todoBox) : super(TodoLoading()) {
    on<LoadTodos>((event, emit) {
      final todos = todoBox.values.toList();
      emit(TodoLoaded(todos));
    });

    on<AddTodo>((event, emit) async {
      final todo = Task(
        title: event.title,
      );
      await todoBox.add(todo);
      add(LoadTodos());
    });

    on<UpdateTodo>((event, emit) async {
      // final todo = todoBox.getAt(event.index);
      // if (todo != null) {
      todoBox.putAt(event.index, Task(title: event.todo.title, isCompleted: event.todo.isCompleted));

      // todo.title = event.todo.title;
      // todo.isCompleted = event.todo.isCompleted;
      // await todo.save();
      add(LoadTodos());
      // }
    });

    on<DeleteTodo>((event, emit) async {
      await todoBox.deleteAt(event.index);
      add(LoadTodos());
    });
  }
}
