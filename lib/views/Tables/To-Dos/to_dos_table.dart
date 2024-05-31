import 'package:flutter/material.dart';

class ToDosTable extends StatefulWidget {
  const ToDosTable({Key? key}) : super(key: key);

  @override
  _ToDosTableState createState() => _ToDosTableState();
}

class _ToDosTableState extends State<ToDosTable> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: SizedBox(
        width: 350,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Title(),
              Divider(height: 50, color: Colors.transparent),
              Table()
            ],
          ),
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "To-Do's",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

class Table extends StatelessWidget {
  const Table({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              width: 1, color: Colors.black, style: BorderStyle.solid)),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: 30,
            height: 30,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
            child: Checkbox(
              value: false,
              onChanged: (e) => print("test"),
            ),
          ),
          Container(
            child: Text("Test"),
          )
        ],
      ),
    );
  }
}
