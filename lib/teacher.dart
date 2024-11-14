import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

class TeacherPage extends StatelessWidget {
  final String username;
  TeacherPage({required this.username});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(36, 199, 191, 1.0),
          title: Text(
            'Hoca Sayfası - $username',
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
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ortalama Hesapla',
                  style: TextStyle(
                    fontSize: 28.0,
                  ),
                ),
              ],
            ),
            GradeCalculator(),
          ],
        ),
      ),
    );
  }
}

class GradeCalculator extends StatefulWidget {
  @override
  _GradeCalculatorState createState() => _GradeCalculatorState();
}

class _GradeCalculatorState extends State<GradeCalculator> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _midtermController = TextEditingController();
  final TextEditingController _finalController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();

  String _result = '';

  void _calculateAverage() {
    String name = _nameController.text;
    double midterm = double.tryParse(_midtermController.text) ?? 0.0;
    double finalExam = double.tryParse(_finalController.text) ?? 0.0;

    double average = (midterm * 0.4) + (finalExam * 0.6);
    setState(() {
      _result =
          "$name isimli öğrencinin\nNot Ortalaması: ${average.toStringAsFixed(2)}";
      _nameController.text = '';
      _midtermController.text = '';
      _finalController.text = '';
      FocusScope.of(context).requestFocus(_nameFocusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            focusNode: _nameFocusNode,
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'İsim',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          TextField(
            controller: _midtermController,
            decoration: InputDecoration(
              labelText: 'Vize',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 16.0,
          ),
          TextField(
            controller: _finalController,
            decoration: InputDecoration(
              labelText: 'Final',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 16.0,
          ),
          ElevatedButton(
            onPressed: _calculateAverage,
            child: Text('Hesapla'),
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            _result,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _midtermController.dispose();
    _finalController.dispose();
    super.dispose();
  }
}
