import 'screens/add_to_do_screen.dart';
import 'screens/sign_up_screen.dart';
import '/screens/to_do_detail_screen.dart';
import '/screens/to_do_list_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (ctx) => const SignUpScreen(),
        ToDoListScreen.routeName: (ctx) => const ToDoListScreen(),
        AddToDoScreen.routeName: (ctx) => AddToDoScreen(),
        ToDoDetailScreen.routeName: (ctx) => ToDoDetailScreen(),
      },
    );
  }
}
