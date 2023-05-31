

import 'package:flutter/material.dart';

class DetailedNotePage extends StatefulWidget {
  const DetailedNotePage({super.key ,required this.name , required this.description});
  final String name;
  final String description;
  @override
  State<DetailedNotePage> createState() => _DetailedNotePageState();
}

class _DetailedNotePageState extends State<DetailedNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 119, 154, 191),
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            const SizedBox(height: 15,),
             Text("Title:\n"),
              const SizedBox(height: 15,),
              Text('${widget.name}'),
              const SizedBox(height: 15,), 
            Divider(color: Colors.black,),
             const SizedBox(height: 15,),
             Text("Description:\n"),
              const SizedBox(height: 15,),
              Text('${widget.description}')
          ],
        ),
      ),
    );
  }
}