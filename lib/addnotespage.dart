import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/bloc/todo_bloc.dart';
import 'package:note_app/data/todos.dart';
import 'package:note_app/widgets/todotext.dart';
import 'package:uuid/uuid.dart';

// ignore: must_be_immutable
class AddNotesPage extends StatefulWidget {
  AddNotesPage({super.key});

  @override
  State<AddNotesPage> createState() => _AddNotesPageState();
}

class _AddNotesPageState extends State<AddNotesPage> {
  String name = "";

  String description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(hintText: "todo"),
            onChanged: (val) {
              name = val;
            },
          ),
          TextFormField(
            maxLines: 2,
            decoration: const InputDecoration(hintText: "description"),
            onChanged: (val) {
              description = val;
            },
          ),
          BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              if (state is TaskInProgress) {
                return const CircularProgressIndicator();
              } else {
                return ElevatedButton(
                  onPressed: () async {
                    String id = const Uuid().v4();
                    Todo todo = Todo(name, id, description);
                    if (mounted) {
                      context.read<TodoBloc>().add(AddTodo(todo));
                      Navigator.of(context).pop();
                    }
                  },
                  child: const TodoText(
                    text: "Save",
                    color: Colors.black,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
