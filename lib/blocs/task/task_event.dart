part of 'task_bloc.dart';

// @immutable
// sealed class TaskEvent {}


abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class LoadTodos extends TodoEvent {}

class AddTodo extends TodoEvent {
  final String title;

  const AddTodo(this.title);

  @override
  List<Object> get props => [title];
}

class UpdateTodo extends TodoEvent {
  final int index;
  final Task todo;

  const UpdateTodo(this.index, this.todo);

  @override
  List<Object> get props => [index, todo];
}

class DeleteTodo extends TodoEvent {
  final int index;

  const DeleteTodo(this.index);

  @override
  List<Object> get props => [index];
}
