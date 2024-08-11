import 'package:flutter/material.dart';
import 'package:simple_flutter_to_do_app/views/Add-Task/add_task_screen.dart';
import 'package:simple_flutter_to_do_app/views/Task-Detail/task_detail.dart';

class ToDosTable extends StatefulWidget {
  const ToDosTable({Key? key}) : super(key: key);

  @override
  _ToDosTableState createState() => _ToDosTableState();
}

class _ToDosTableState extends State<ToDosTable> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: 375,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Title(),
              Divider(height: 50, color: Colors.transparent),
              SizedBox(
                height: 300,
                child: Table(context: context),
              ),
              Divider(height: 50, color: Colors.transparent),
              NavigateToAddTaskScreenBtn(),
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

class Table extends StatefulWidget {
  final BuildContext context;
  const Table({Key? key, required this.context}) : super(key: key);

  @override
  _TableState createState() => _TableState();
}

class _TableState extends State<Table> {
  final List<String> entries = <String>["Testin", "testin", "testing"];
  final List<int> colorCodes = <int>[600, 500, 100];

  final List<DataColumn> columns = [
    DataColumn(
        label: Expanded(
      child: Text("Name"),
    )),
    DataColumn(
        label: Expanded(
      child: Text("Date"),
    )),
    DataColumn(
        label: Expanded(
      child: Text("View/Edit"),
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: columns,
      rows: [
        DataRow(
            // color: ,
            onSelectChanged: (value) =>
                {debugPrint('testing'), showTaskDetailPopUp(context)},
            cells: <DataCell>[
              DataCell(Text(
                checkDescLenght("something"),
              )),
              DataCell(Text("07/01/2024")),
              DataCell(RemoveTaskBtn()),
            ]),
        DataRow(
            // color: ,
            onSelectChanged: (value) =>
                {debugPrint('testing'), showTaskDetailPopUp(context)},
            cells: <DataCell>[
              DataCell(Text(
                checkDescLenght("something"),
              )),
              DataCell(Text("07/01/2024")),
              DataCell(RemoveTaskBtn()),
            ]),
        DataRow(
            // color: ,
            onSelectChanged: (value) =>
                {debugPrint('testing'), showTaskDetailPopUp(context)},
            cells: <DataCell>[
              DataCell(Text(
                checkDescLenght("something"),
              )),
              DataCell(Text("07/01/2024")),
              DataCell(RemoveTaskBtn()),
            ]),
        DataRow(
            // color: ,
            onSelectChanged: (value) =>
                {debugPrint('testing'), showTaskDetailPopUp(context)},
            cells: <DataCell>[
              DataCell(Text(
                checkDescLenght("something"),
              )),
              DataCell(Text("07/01/2024")),
              DataCell(RemoveTaskBtn()),
            ]),
        DataRow(
            // color: ,
            onSelectChanged: (value) =>
                {debugPrint('testing'), showTaskDetailPopUp(context)},
            cells: <DataCell>[
              DataCell(Text(
                checkDescLenght("something"),
              )),
              DataCell(Text("07/01/2024")),
              DataCell(RemoveTaskBtn()),
            ]),
        DataRow(
            // color: ,
            onSelectChanged: (value) =>
                {debugPrint('testing'), showTaskDetailPopUp(context)},
            cells: <DataCell>[
              DataCell(Text(
                checkDescLenght("something"),
              )),
              DataCell(Text("07/01/2024")),
              DataCell(RemoveTaskBtn()),
            ]),
      ],
      dividerThickness: 1,
      columnSpacing: 35,
      showBottomBorder: true,
      showCheckboxColumn: false,
    );
  }
}

class NavigateToAddTaskScreenBtn extends StatelessWidget {
  const NavigateToAddTaskScreenBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => showAddTaskPopUp(context),
        child: const Row(
          children: [Spacer(), Icon(Icons.add), Text("Add a Task "), Spacer()],
        ));
  }
}

class RemoveTaskBtn extends StatelessWidget {
  const RemoveTaskBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(2.5),
          backgroundColor:
              MaterialStateColor.resolveWith((states) => Colors.red)),
      onPressed: () => debugPrint("test"),
      child: Text("Edit"),
    );
  }
}

showAddTaskPopUp(context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const AddTaskModal()));
}

showTaskDetailPopUp(context) {
  showDialog(context: context, builder: (BuildContext context) => TaskDetail());
}

checkDescLenght(String value) {
  var newValue = "";
  if (value.length > 14) {
    newValue = value.substring(0, 5);
    newValue = newValue + "...";
    debugPrint(" value -->>  $value and newvalue --->> $newValue");
    return newValue;
  }
  return value;
}
