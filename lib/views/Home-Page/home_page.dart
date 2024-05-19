import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Simple To-Do App"),
      ),
      body: const SingleChildScrollView(
          child: Center(
        child: Column(
          children: [Text("To Dos'")],
        ),
      )),
    );
  }
}
