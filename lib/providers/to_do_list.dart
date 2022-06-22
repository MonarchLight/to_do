import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:to_do/models/to_do_list.dart';

class ToDoList with ChangeNotifier {
  List<ToDo> _items = [];

  List<ToDo> get items {
    return [..._items];
  }

  ToDo findById(String id) {
    return _items.firstWhere((todo) => todo.id == id);
  }

  /* Future<void> addToDo(
    String pickedtitle,
    File pickedimage,
    String description,
    DateTime date,
  ) async {
    final newPlace = ToDo(
      id: DateTime.now().toString(),
      image: pickedimage,
      title: pickedtitle,
      description: description,
      date: date,
    );
    _items.add(newPlace);
    notifyListeners();
    ;
  }*/
}
