import 'package:flutter/material.dart';

class Loginui extends StatefulWidget {
  @override
  _LoginuiState createState() => _LoginuiState();
}

class _LoginuiState extends State<Loginui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            children: <Widget>[
              TextField(
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.done,
              )
            ],
          ),
        ),
        backgroundColor: Colors.grey,
        
        
    );
  }
}