import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_crud/config/network.dart';
import 'package:flutter_crud/pages/home.dart';
import 'package:flutter_crud/pages/stackedicon/stakedicons.dart';
import 'package:flutter_crud/widgets/splashscreen/splashscreen.dart';
import 'package:flutter_crud/widgets/toast/toast.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  static TextEditingController _username = TextEditingController();
  static TextEditingController _password = TextEditingController();

  Future<Map> LoginFunc() async {
    print(_username.text+':'+_password.text);
    Map data = {
      "email" :_username.text,
      "password" :_password.text
    };

    await http.post(apiUrl+'/login',body: data).then((response){
      var value = json.decode(response.body);
      print(value);
      if (value['success'] == true) {
        var token = value['token'];
        var name = value['data']['username'];
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => SplashScreen()
            )
        );
      }else
      {
        return invalid_credential_msg();
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          backgroundColor:Colors.transparent,
          elevation: 0.0,
          iconTheme: new IconThemeData(color: Color(0xFF18D191))),
      body: Container(
        width: double.infinity,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new StakedIcons(),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 80.0),
                  child: new Text(
                    "Cloudelabs",
                    style: new TextStyle(fontSize: 30.0),
                  ),
                )
              ],
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              child: new TextField(
                controller: _username,
                decoration: new InputDecoration(labelText: 'Email'),
              ),
            ),
            new SizedBox(
              height: 15.0,
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              child: new TextField(
                obscureText: true,
                controller: _password,
                decoration: new InputDecoration(labelText: 'Password'),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              child: new TextField(
                obscureText: true,
                controller: _password,
                decoration: new InputDecoration(labelText: 'Name'),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 5.0, top: 10.0),
                    child: GestureDetector(
                      onTap: () => LoginFunc(),
                      child: new Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          decoration: new BoxDecoration(
                              color: Color(0xFF18D191),
                              borderRadius: new BorderRadius.circular(9.0)),
                          child: new Text("Signup",
                              style: new TextStyle(
                                  fontSize: 20.0, color: Colors.white))),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 20.0, top: 10.0),
                    child: new Container(
                        alignment: Alignment.center,
                        height: 60.0,
                        child: new Text("SignIn",
                            style: new TextStyle(
                                fontSize: 25.0, color: Color(0xFF18D191)))),
                  ),
                )
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom:18.0),
                    child: new Text("Create A New Account ",style: new TextStyle(
                        fontSize: 17.0, color: Color(0xFF18D191),fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
