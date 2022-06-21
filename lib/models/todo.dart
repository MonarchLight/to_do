import 'dart:io';

class ToDo {
  final String id;
  final String title;
  final DateTime date;
  final bool important;
  final File image;
  final String description;

  ToDo(
      {required this.id,
      required this.image,
      required this.date,
      required this.description,
      required this.important,
      required this.title});
}
