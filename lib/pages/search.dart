import 'package:flutter/material.dart';
import 'package:flutter_crud/widgets/drawer/naviationdrawer.dart';
import 'package:flutter_crud/widgets/theme/theme.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: drawerBackgroundColor,
        title: Text('Search'),
      ),
      drawer: NavigateDrawer(),
    );
  }
}