import 'package:flutter/material.dart';
import 'package:to_do/screens/to_do_list_screen.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = "/sign_up_screen";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(0xff383838), Colors.grey])),
      child: Align(
        alignment: Alignment.bottomCenter / 3,
        child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 25, vertical: 10)),
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)))),
            backgroundColor: MaterialStateProperty.all(const Color(0xffffd600)),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(ToDoListScreen.routeName);
          },
          child: const Text("Вхід",
              style: TextStyle(color: Colors.black, fontSize: 25)),
        ),
      ),
    );
  }
}
