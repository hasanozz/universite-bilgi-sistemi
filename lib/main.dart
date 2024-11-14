import 'package:flutter/material.dart';
import 'package:week5_mbs/assistant.dart';
import 'student.dart';
import 'assistant.dart';
import 'teacher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(36, 199, 191, 1.0),
          title: Text(
            'Giriş',
            style: TextStyle(color: Colors.white, fontSize: 24.0),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                child: Image(image: AssetImage('images/medeniyet.png')),
              ),
            ),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _result = '';

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    setState(() {
      if (_usernameController.text.isEmpty ||
          _passwordController.text.isEmpty) {
        _result = 'Kullanıcı adı ve şifre boş bırakılamaz.';
      } else if (password == 'ogrenci') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StudentPage(username: username),
          ),
        );
        _result = '';
        _usernameController.text = '';
        _passwordController.text = '';
      } else if (password == 'asistan') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AssistantPage(username: username),
          ),
        );
        _result = '';
        _usernameController.text = '';
        _passwordController.text = '';
      } else if (password == 'hoca') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TeacherPage(username: username),
          ),
        );
        _result = '';
        _usernameController.text = '';
        _passwordController.text = '';
      }
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
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Kullanıcı Adı',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Şifre',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          Text(
            _result,
            style: TextStyle(color: Colors.red),
          ),
          SizedBox(
            height: 16.0,
          ),
          ElevatedButton(
            onPressed: _login,
            child: Text('Giriş Yapın'),
          ),
        ],
      ),
    );
  }
}
