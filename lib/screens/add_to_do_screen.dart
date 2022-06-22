import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/providers/to_do_list.dart';

import '../widgets/image_input.dart';

class AddToDoScreen extends StatefulWidget {
  static const routeName = "/add_to_do_screen";

  @override
  _AddToDoScreenState createState() => _AddToDoScreenState();
}

class _AddToDoScreenState extends State<AddToDoScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  File? _pickedImage;
  DateTime? _date;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty ||
        _pickedImage == null ||
        _date == null ||
        _descriptionController.text.isEmpty) {
      return;
    }
    /*Provider.of<ToDoList>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage!, _date);
    Navigator.of(context).pop();*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(labelText: 'Додати опис'),
          controller: _titleController,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Додати опис'),
                      controller: _descriptionController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ImageInput(_selectImage),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.amber,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: _savePlace,
            icon: const Icon(Icons.add),
            label: const Text("Створити"),
          ),
        ],
      ),
    );
  }
}
