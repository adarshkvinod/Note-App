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
      backgroundColor: Color.fromARGB(255, 119, 154, 191),
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              maxLines: 2,
              decoration: const InputDecoration(hintText: "Title"),
              onChanged: (val) {
                name = val;
              },
            ),
            TextFormField(
              maxLines: 20,
              decoration: const InputDecoration(hintText: "Description"),
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
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black)
                    ),
                    
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
                      color: Colors.white,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
