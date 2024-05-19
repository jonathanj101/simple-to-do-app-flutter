import 'package:flutter/material.dart';

class CustomTable extends StatefulWidget {
  const CustomTable({Key? key}) : super(key: key);

  @override
  TableState createState() => TableState();
}

class TableState extends State<CustomTable> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Center(
          child: SizedBox(
        // width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Headers()],
        ),
      )),
    );
  }
}

class Headers extends StatelessWidget {
  const Headers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.red)),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Checkbox(value: false, onChanged: (e) => print("test")),
                    const SizedBox(
                      width: 10,
                      child: VerticalDivider(
                        thickness: 1,
                        color: Colors.red,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text("Some"),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
