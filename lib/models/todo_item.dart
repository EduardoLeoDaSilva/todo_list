class TodoItem{

  TodoItem({this.title, this.date});

  TodoItem.fromJson(Map<String, dynamic> json){
    title = json['title'];
    date = DateTime.parse(json['date']);
  }
  

  Map<String, dynamic> toJson(){
    return {
      'title': title,
      'date': date?.toIso8601String()
    };
  }

  String? title;
  DateTime? date;

}