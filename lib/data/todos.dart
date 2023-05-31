class Todo {
  String id;
  String name;
  String description;
  Todo(this.name, this.id , this.description);

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(json['name'], json['id'], json["description"]);
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "id": id, "description" : description};
  }
}
