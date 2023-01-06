import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_maven/UI/my_themes.dart';
import 'package:task_maven/UI/widgets/button.dart';
import 'package:task_maven/UI/widgets/input_field.dart';
import 'package:task_maven/controllers/task_controller.dart';
import '../services/theme_Services.dart';
import 'package:get/get.dart';
import 'package:task_maven/models/task.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat("H:m").format(DateTime.now()).toString();
  String _endTime = "00:00";
  int _selectedRemind = 5;
  List<int> remindList = [
    5,
    10,
    15,
    20,
    30,
    45,
    60,
  ];
  String _selectedRepeat = "Tekrar yok";
  List<String> repeatList = [
    "Tekrar yok",
    "Günlük",
    "Haftalık",
    "Aylık",
  ];
  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(context),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyInputField(
                  title: "Baslık",
                  hint: "Bir baslık giriniz...",
                  controller: _titleController,
                ),
                MyInputField(
                  title: "Note",
                  hint: "Bir not giriniz...",
                  controller: _noteController,
                ),
                MyInputField(
                  title: "Tarih",
                  hint: DateFormat.yMd().format(_selectedDate),
                  widget: IconButton(
                    icon: const Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      _getDateFromUser();
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyInputField(
                        title: "Baslangıc",
                        hint: _startTime,
                        widget: IconButton(
                          onPressed: () {
                            _getTimeFromUser(true);
                          },
                          icon: const Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: MyInputField(
                        title: "Bitis",
                        hint: _endTime,
                        widget: IconButton(
                          onPressed: () {
                            _getTimeFromUser(false);
                          },
                          icon: const Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                MyInputField(
                  title: "Hatırlat",
                  hint: "$_selectedRemind dakika önce",
                  widget: DropdownButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    iconSize: 32,
                    underline: Container(
                      height: 0,
                    ),
                    elevation: 4,
                    style: subTitleStyle,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedRemind = int.parse(newValue!);
                      });
                    },
                    items:
                        remindList.map<DropdownMenuItem<String>>((int value) {
                      return DropdownMenuItem<String>(
                        value: value.toString(),
                        child: Text(value.toString()),
                      );
                    }).toList(),
                  ),
                ),
                MyInputField(
                  title: "Tekrar",
                  hint: "$_selectedRepeat",
                  widget: DropdownButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    iconSize: 32,
                    underline: Container(
                      height: 0,
                    ),
                    elevation: 4,
                    style: subTitleStyle,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedRepeat = newValue!;
                      });
                    },
                    items: repeatList
                        .map<DropdownMenuItem<String>>((String? value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value!,
                          style: TextStyle(color: Colors.grey),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _colorPallete(),
                    MyButton(
                        label: "Görev Oluştur", onTap: () => _validateDate())
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _validateDate() {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      _addTaskToDb();
      Get.back();
    } else if (_titleController.text.isEmpty || _noteController.text.isEmpty) {
      Get.snackbar("Boş Bırakılamaz", "Bir başlık ve not girmelisin",
          colorText: Colors.white,
          duration: Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          icon: const Icon(
            Icons.warning_amber_rounded,
            color: Colors.white,
          ));
    }
  }

  _addTaskToDb() async {
    int value = await _taskController.addTask(
        task: Task(
      note: _noteController.text,
      title: _titleController.text,
      date: DateFormat.yMd().format(_selectedDate),
      startTime: _startTime,
      endTime: _endTime,
      remind: _selectedRemind,
      repeat: _selectedRepeat,
      color: _selectedColor,
      isCompleted: 0,
    ));
    print("my id is" + "$value");
  }

  Column _colorPallete() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Renk",
          style: titleStyle,
        ),
        const SizedBox(
          height: 5,
        ),
        Wrap(
          children: List<Widget>.generate(
            3,
            (int clrCheck) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedColor = clrCheck;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 8.0,
                  ),
                  child: (CircleAvatar(
                    radius: 14,
                    backgroundColor: clrCheck == 0
                        ? primaryClr
                        : clrCheck == 1
                            ? pinkClr
                            : yellowClr,
                    child: _selectedColor == clrCheck
                        ? const Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 16,
                          )
                        : Container(),
                  )),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: const [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage("images/profile_img.png"),
        ),
        SizedBox(
          width: 18,
        )
      ],
      centerTitle: true,
      title: Text(
        "Görev Ekle",
        style: headingStyle,
      ),
    );
  }

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {
      print('someting wrong with selectedDate or selectedDate is null');
    }
  }

  _getTimeFromUser(bool isStartTime) async {
    var pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print("Time canceled");
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formatedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = _formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
        hour: int.parse(_startTime.split(":")[0]),
        minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
      ),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child ?? Container(),
        );
      },
    );
  }
}
