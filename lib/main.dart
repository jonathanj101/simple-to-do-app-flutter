import 'package:flutter/material.dart';
import 'package:simple_flutter_to_do_app/views/Home-Page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        title: "Simple To-Do App With Flutter",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // useMaterial3: true,
        ),
        home: const HomePage());
  }
}
