import 'package:flutter/material.dart';
import 'package:flutter_crud/main.dart';
import 'package:flutter_crud/widgets/theme/theme.dart';

class Error extends StatefulWidget {
  @override
  _ErrorState createState() => _ErrorState();
}

class _ErrorState extends State<Error> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: drawerBackgroundColor,
        title: Text('Error'),
      ),
      drawer: NavigateDrawer(),
    );
  }
}