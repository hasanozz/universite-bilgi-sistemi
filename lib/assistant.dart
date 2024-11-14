import 'package:flutter/material.dart';

class AssistantPage extends StatelessWidget {
  final String username;
  AssistantPage({required this.username});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(36, 199, 191, 1.0),
          title: Text(
            'Asistan Sayfası - $username',
            style: TextStyle(color: Colors.white, fontSize: 24.0),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
          ),
        ),
        body: Column(
          children: <Widget>[
            // SizedBox(
            //   height: 8.0,
            // ),
            // Center(
            //   child: Text(
            //     'Duyurular',
            //     style: TextStyle(fontSize: 24.0),
            //   ),
            // ),
            Expanded(child: AssistantApp()),
          ],
        ),
      ),
    );
  }
}

class AssistantApp extends StatefulWidget {
  @override
  _AssistantAppState createState() => _AssistantAppState();
}

class _AssistantAppState extends State<AssistantApp> {
  final TextEditingController _announcementController = TextEditingController();
  final List<String> _announcements = [];
  int _selectRadio = 0;
  final TextEditingController _nameController = TextEditingController();
  List<String> _studentList = [];
  List<String> _teacherList = [];

  void _handleRadioValueChange(int? value) {
    setState(() {
      _selectRadio = value!;
    });
  }

  void _addNameToList() {
    String name = _nameController.text.trim();
    if (name.isNotEmpty) {
      setState(() {
        if (_selectRadio == 1) {
          _studentList.add(name);
          _announcements.add("$name adlı öğrenci okulumuza kaydolmuştur.");
        }
        if (_selectRadio == 2) {
          _teacherList.add(name);
          _announcements
              .add("$name adlı hoca okulumuzda eğitim vermeye başlamıştır.");
        }
        _nameController.clear();
      });
    }
  }

  void _addNewAnnouncement(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _announcements.add(task);
      });
      _announcementController.text = '';
    }
  }

  void _removeAnnouncement(int index) {
    setState(() {
      _announcements.removeAt(index);
    });
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 26.0, horizontal: 12.0),
      child: Column(
        children: [
          Text(
            "Sistem Kayıt",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(
            height: 16.0,
          ),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'İsim',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Radio(
                  value: 1,
                  groupValue: _selectRadio,
                  onChanged: _handleRadioValueChange),
              Text("Öğrenci"),
              Radio(
                  value: 2,
                  groupValue: _selectRadio,
                  onChanged: _handleRadioValueChange),
              Text("Öğretmen"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 125,
              height: 40,
              child: ElevatedButton(
                onPressed: _addNameToList,
                child: Text("Ekle"),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            "Duyurular",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _announcementController,
                  decoration: InputDecoration(
                    labelText: 'Duyuru Ekle',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              ElevatedButton(
                onPressed: () =>
                    _addNewAnnouncement(_announcementController.text),
                child: Icon(Icons.add),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(15),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _announcements.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_announcements[index]),
                  trailing: IconButton(
                    onPressed: () => _removeAnnouncement(index),
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
