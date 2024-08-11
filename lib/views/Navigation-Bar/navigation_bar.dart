import 'package:flutter/material.dart';
import 'package:simple_flutter_to_do_app/views/Home-Page/home_page.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int myIndex = 1;
  @override
  Widget build(BuildContext context) {
    List list = [
      Text("Completed"),
      HomePage(),
    ];
    return Scaffold(
      body: Center(
        child: list[myIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Colors.lightBlue,
          unselectedFontSize: 12,
          onTap: (index) => {setState(() => myIndex = index)},
          currentIndex: myIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.checklist_rounded),
              label: "Completed",
              backgroundColor: Color.fromRGBO(31, 64, 134, 1),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.toc_outlined),
              label: "To Do",
              backgroundColor: Color.fromRGBO(31, 64, 134, 1),
            )
          ]),
    );
  }
}
