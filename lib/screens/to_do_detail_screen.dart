import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/providers/to_do_list.dart';

class ToDoDetailScreen extends StatelessWidget {
  static const routeName = "/to_do_detail_screen";

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    final selectPlace =
        Provider.of<ToDoList>(context, listen: false).findById(id as String);
    return Scaffold(
      appBar: AppBar(title: Text(selectPlace.title)),
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            child: Image.file(
              selectPlace.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
