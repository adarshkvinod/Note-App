part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchTodos extends TodoEvent {}

class AddTodo extends TodoEvent {
  final Todo todo;
  AddTodo(this.todo,);
  @override
  List<Object?> get props => [todo];
  
}

class FindID extends TodoEvent{
   late final String id;
   FindID(this.id);
  
}

