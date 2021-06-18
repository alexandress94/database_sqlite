class TodoModel {
  int? id;
  String? title;
  String? date;

  TodoModel({
    this.id,
    this.title,
    this.date,
  });

  Map<String, dynamic> toMap() {
    var map = {
      'id': this.id,
      'title': this.title,
      'date': this.date,
    };
    return map;
  }

  TodoModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    date = map['date'];
  }
}
