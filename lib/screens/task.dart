import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  static const routeName = "/task";

  const Task({Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int currentPage = 0;
  Widget NavigationButton(String title, int i) {
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
          style: TextStyle(color: Colors.black, fontSize: 20),
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
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NavigationButton("Усі", 0),
                    NavigationButton("Робочі", 1),
                    NavigationButton("Особисті", 2),
                  ],
                ),
              ),
              Container(
                height: 500,
                padding: EdgeInsets.all(10),
                child: Consumer<ToDoList>(
                    child: Center(
                        child: Text("Got no places yet, start adding some!")),
                    builder: (ctx, greatPlaces, ch) => greatPlaces.items.isEmpty
                        ? ch!
                        : ListView.builder(
                            itemCount: greatPlaces.items.length,
                            itemBuilder: (ctx, i) => ListTile(
                              leading: CircleAvatar(
                                  backgroundImage:
                                      FileImage(greatPlaces.items[i].image)),
                              title: Text(greatPlaces.items[i].title),
                              subtitle: Text(greatPlaces
                                  .items[i].location.address as String),
                              onTap: () {
                                Navigator.of(context).pushNamed(NAME.routeName,
                                    arguments: greatPlaces.items[i].id);
                              },
                            ),
                          )),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child:
              Icon(Icons.add, size: 50, color: Color.fromARGB(255, 74, 74, 74)),
          backgroundColor: Color(0xffffd600),
          onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
