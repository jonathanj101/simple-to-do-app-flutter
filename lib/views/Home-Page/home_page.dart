import 'package:flutter/material.dart';
import 'package:simple_flutter_to_do_app/views/Table/table.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divider(
              color: Colors.transparent,
              height: 100,
            ),
            Title(),
            CustomTable()
          ],
        ),
      )),
    );
  }
}

class Title extends StatelessWidget {
  const Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("Reminder of To-Do's");
  }
}
