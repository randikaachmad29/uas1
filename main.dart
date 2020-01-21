import 'dart:async';
import 'dart:convert';

import 'package:uas_visual/landing.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'AdminPage.dart';
import 'MemberPage.dart';


void main() => runApp(new MyApp());

String username = '';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login PHP My Admin',
      home: new MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/landing': (BuildContext context) => new landing(),
        '/MemberPage': (BuildContext context) => new MemberPage(
              username: username,
            ),
        '/MyHomePage': (BuildContext context) => new MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  String msg = '';

  Future<List> _login() async {
    final response =
        await http.post("http://10.0.2.2/mahasiswa/login.php", body: {
      "username": user.text,
      "password": pass.text,
    });

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        msg = "Login Fail";
      });
    } else {
      if (datauser[0]['level'] == 'admin') {
        Navigator.pushReplacementNamed(context, '/landing');
      } else if (datauser[0]['level'] == 'member') {
        Navigator.pushReplacementNamed(context, '/MemberPage');
      }

      setState(() {
        username = datauser[0]['username'];
      });
    }

    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Silahkan Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Padding(padding: new EdgeInsets.only(top: 100.0)),
                new TextField(
                    controller: user,
                    decoration: new InputDecoration(
                        hintText: "Input Username",
                        labelText: "Username",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0)))),
                new Padding(padding: new EdgeInsets.all(5.0)),
                new TextField(
                    controller: pass,
                    decoration: new InputDecoration(
                        hintText: "Input Password",
                        labelText: "Password",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0)))),
                new Padding(padding: new EdgeInsets.all(5.0)),
                new RaisedButton(
                  child: new Text("Login"),
                  color: Colors.cyan,
                  onPressed: () {
                    _login();
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new MyApp()));
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
