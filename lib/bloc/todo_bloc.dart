// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import '../data/todos.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoLoading([])) {
    on<FetchTodos>((event, emit) => fetchTodos(event, emit));
    on<AddTodo>((event, emit) => addTodos(event, emit));
  }

  Future<void> fetchTodos(FetchTodos event, Emitter emit) async {
    final todos = await FirebaseFirestore.instance.collection("todos").get();
    List<QueryDocumentSnapshot> docsList = todos.docs;
    List<Todo> todoList = [];
    for (int i = 0; i < docsList.length; i++) {
      todoList.add(Todo(docsList[i]["name"], docsList[i]['id'] , docsList[i]["description"]));
    }
    emit(TodosFetched(todoList));
  }

  void addTodos(AddTodo event, Emitter emit) async {
    List<Todo> list = List.from(state.data);
    emit(TaskInProgress(list));
    await FirebaseFirestore.instance
        .collection("todos")
        .doc(event.todo.id)
        .set(event.todo.toJson());
    List<Todo> todosData = List.from(state.data);
    todosData.add(event.todo);
    emit(TodoAdded(todosData));
  }

  
}
