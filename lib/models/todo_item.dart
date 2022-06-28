class TodoItem{

  TodoItem({this.title, this.date});

  TodoItem.fromJson(Map<String, dynamic> json){
    title = json['title'];
    date = json['date'];
  }
  

  Map<String, dynamic> toJson(){
    return {
      'title': title,
      'date': date
    };
  }

  String? title;
  DateTime? date;

}