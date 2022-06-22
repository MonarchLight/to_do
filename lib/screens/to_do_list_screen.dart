import 'add_to_do_screen.dart';
import '../screens/to_do_detail_screen.dart';
import '../providers/to_do_list.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ToDoListScreen extends StatefulWidget {
  static const routeName = "/to_do_list_screen";

  const ToDoListScreen({Key? key}) : super(key: key);

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  int currentPage = 0;

  Widget navigationButton(String title, int i) {
    return SizedBox(
      width: 110,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: i == currentPage ? MaterialStateProperty.all(15) : null,
            shadowColor: MaterialStateProperty.all(Colors.black),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 5, vertical: 10)),
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)))),
            backgroundColor: i == currentPage
                ? MaterialStateProperty.all(const Color(0xfffbefb4))
                : MaterialStateProperty.all(const Color(0xffdbdbdb))),
        onPressed: () {
          setState(() {
            currentPage = i;
          });
        },
        child: Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color(0xff383838), Colors.grey])),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    navigationButton("Усі", 0),
                    navigationButton("Робочі", 1),
                    navigationButton("Особисті", 2),
                  ],
                ),
              ),
               CircleAvatar(child: ,)
               
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: const Color(0xffffd600),
          onPressed: () {
            Navigator.of(context).pushNamed(AddToDoScreen.routeName);
          },
          child: const Icon(Icons.add,
              size: 50, color: Color.fromARGB(255, 74, 74, 74))),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
