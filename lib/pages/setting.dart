import 'package:flutter/material.dart';
import 'package:flutter_crud/main.dart';
import 'package:flutter_crud/theme.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: drawerBackgroundColor,
        title: Text('Setting'),
      ),
    );
  }
}