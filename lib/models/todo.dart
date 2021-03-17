class TodoItem {
  int id;
  String title;
  String content;
  bool isCompleted;

  TodoItem copyWith({int id, String title, String content, bool isCompleted}) {
    return new TodoItem(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  TodoItem({this.id, this.title, this.content, this.isCompleted});
}
