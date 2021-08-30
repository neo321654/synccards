class Task {
  int id;
  int order;
  String name;
  String description;
  String? additionalDescription;

  Task(
      {required this.id,
      required this.order,
      required this.name,
      required this.description,
      required this.additionalDescription});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json["id"],
      order: json["order"],
      name: json["url"],
      description: json["title"],
      additionalDescription: json["body"],
    );
  }
}
