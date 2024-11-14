import 'package:flutter/material.dart';

class StudentPage extends StatelessWidget {
  final String username;
  StudentPage({required this.username});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(36, 199, 191, 1.0),
          title: Text(
            'Öğrenci Sayfası - $username',
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
            SizedBox(
              height: 8.0,
            ),
            Center(
              child: Text(
                'Yapılacaklar',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            Expanded(child: TodoPage()),
          ],
        ),
      ),
    );
  }
}

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController _jobController = TextEditingController();
  final List<String> _jobs = [];

  void _addNewJob(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _jobs.add(task);
      });
      _jobController.text = '';
    }
  }

  void _removeJob(int index) {
    setState(() {
      _jobs.removeAt(index);
    });
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 26.0, horizontal: 12.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _jobController,
                  decoration: InputDecoration(
                    labelText: 'Görev Ekle',
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
                onPressed: () => _addNewJob(_jobController.text),
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
              itemCount: _jobs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_jobs[index]),
                  trailing: IconButton(
                    onPressed: () => _removeJob(index),
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
