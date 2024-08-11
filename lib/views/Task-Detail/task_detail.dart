import 'package:flutter/material.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "What do you want to remember?"),
            ),
            SizedBox(
              width: 320,
              child: ElevatedButton(
                onPressed: () => debugPrint("testing dialog"),
                child: const Text("something"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
