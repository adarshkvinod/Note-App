import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/addnotespage.dart';
import 'package:note_app/bloc/todo_bloc.dart';
import 'package:note_app/shownotes.dart';

import 'widgets/todotext.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 119, 154, 191),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: TodoText(
          text: widget.title,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          height: height,
          width: width,
          child: BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              if (state is TodosFetched || state is TodoAdded) {
                return ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 10,
                      thickness: 0.5,
                      color: Colors.black,
                    );
                  },
                  itemCount: state.data.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailedNotePage(
                                      name: state.data[index].name,
                                      description: state.data[index].description,
                                    )));
                      },
                      child: ListTile(
                        titleTextStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w900),
                        title: Text(state.data[index].name),
                        subtitle: Text(state.data[index].description),
                      ),
                    );
                  }),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        hoverElevation: 20,
        backgroundColor: Colors.black,
        elevation: 25,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () async {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNotesPage()));
        },
      ),
    );
  }
}
