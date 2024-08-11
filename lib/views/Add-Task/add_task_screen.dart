import 'package:flutter/material.dart';

class AddTaskModal extends StatefulWidget {
  const AddTaskModal({Key? key}) : super(key: key);

  @override
  _AddTaskModalState createState() => _AddTaskModalState();
}

class _AddTaskModalState extends State<AddTaskModal> {
  String description = "";
  final formKey = GlobalKey<FormState>();

  final descriptionController = TextEditingController();
  Map selectedDueDate = {};

  @override
  void initState() {
    super.initState();
    descriptionController.addListener(updateDescriptionField);
  }

  void updateDescriptionField() {
    setState(() {
      description = descriptionController.text;
    });
  }

  void updateSelectedStartDate(value) {
    setState(() {
      selectedDueDate.addAll(dateFormat(value));
    });
  }

  void _showDatePicker(BuildContext context, bool isBeginDate) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      confirmText: "Save",
      cancelText: "Cancel",
      onDatePickerModeChange: (value) => print(value),
      builder: (context, child) => Theme(
          data: ThemeData().copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromRGBO(27, 126, 255, 1),
              onPrimary: Colors.white,
              onSurface: Colors.white,
            ),
            dividerColor: Colors.deepOrange,
            highlightColor: Colors.deepOrange,
            textTheme:
                const TextTheme(titleMedium: TextStyle(color: Colors.white)),
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)))),
            inputDecorationTheme: const InputDecorationTheme(
              floatingLabelStyle:
                  TextStyle(color: Color.fromARGB(255, 255, 41, 34)),
            ),
            dialogBackgroundColor: Color.fromARGB(255, 118, 164, 255),
          ),
          child: child!),
    ).then((value) {
      if (value != null) {
        if (isBeginDate) {
          // selectedStartDate.addAll(dateFormat(value));
          updateSelectedStartDate(value);
          print(selectedDueDate);
        }
        // else {
        //   selectedEndDate.addAll(dateFormat(value));
        // }
      }
      // print(selectedDate["date"].add(Duration(minutes: 90)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a task"),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Form(
                key: formKey,
                child: Center(
                  child: SizedBox(
                    height: 350,
                    width: 350,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: descriptionController,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.transparent,
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: "Description",
                              hintText: "Ex: Rent, Groceries etc...",
                              prefixIcon: Icon(
                                Icons.short_text_outlined,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder()),
                          validator: (value) {
                            return value!.isEmpty
                                ? "Please enter description of task"
                                : null;
                          },
                        ),
                        SelectDueDate(
                            dueDateValue: selectedDueDate,
                            showDatePicker: _showDatePicker)
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Add a task");
  }
}

class SelectDueDate extends StatefulWidget {
  final Map dueDateValue;
  final Function showDatePicker;
  const SelectDueDate(
      {Key? key, required this.dueDateValue, required this.showDatePicker})
      : super(key: key);

  @override
  _SelectDueDateState createState() => _SelectDueDateState();
}

class _SelectDueDateState extends State<SelectDueDate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
          // color: const Color.fromRGBO(97, 128, 191, 1),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Text(
            widget.dueDateValue["format"] ??
                "Due Date" ??
                widget.dueDateValue["format"],
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          const Spacer(
            flex: 16,
          ),
          SizedBox(
            width: 40,
            height: 40,
            child: ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.resolveWith((states) =>
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 0)),
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => const Color.fromRGBO(238, 119, 68, 1))),
                onPressed: () => widget.showDatePicker(context, true),
                child: const Icon(Icons.calendar_month)),
          )
        ],
      ),
    );
  }
}

dateFormat(date) {
  var parsedDate = DateTime.parse("$date");
  var month = parsedDate.month;
  var day = parsedDate.day;
  var year = parsedDate.year;
  return {"format": "$month/$day/$year", "date": parsedDate};
}
