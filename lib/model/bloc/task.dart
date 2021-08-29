class Task {
  int id;
  String name;
  String description;
  String? additionalDescription;

  Task(
      {required this.id,
      required this.name,
      required this.description,
      required this.additionalDescription});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json["id"],
      name: json["url"],
      description: json["title"],
      additionalDescription: json["body"],
    );
  }
}
