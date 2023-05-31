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
      appBar: AppBar(),
      body: Column(
        children: [
           Text("Note Name : ${widget.name}"),
           Text("Note description : ${widget.description}"),
        ],
      ),
    );
  }
}