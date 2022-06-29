import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/models/todo_item.dart';

class TodoRepository{

 
  Future<SharedPreferences> getInstance() async {
    var instance = await SharedPreferences.getInstance();
    return instance;
 }

 Future<bool> saveTodoItem(List<TodoItem> list) async{
  var instance = await getInstance();

  var success = instance.setString('todoList', json.encode(list));
  return success;
 }


 Future<List<TodoItem>?> getListTodoItem() async {
  var instance = await getInstance();
  var jsonText = instance.getString('todoList');
  if(jsonText != null){
  var jsonAsList = json.decode(jsonText) as List;
  return jsonAsList.map((e) => TodoItem.fromJson(e)).toList();

  }
  return [];
  // return jsonAsList.map((e) => TodoItem.fromJson(e)).toList();

 }

}