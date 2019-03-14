import 'package:flutter/material.dart';
import 'package:flutter_crud/widgets/drawer/CollapsingNavigationDrawer.dart';
import 'package:flutter_crud/widgets/theme/theme.dart';

class NavigateDrawer extends StatefulWidget {
  @override
  _NavigateDrawerState createState() => _NavigateDrawerState();
}

class _NavigateDrawerState extends State<NavigateDrawer> {
  @override
  Widget build(BuildContext context) {
	return Scaffold(
	  appBar: AppBar(
		  elevation: 0.0,
		  backgroundColor: drawerBackgroundColor,
		  title: Text("Navbar"),
	  ),
	  body: Stack(
		  children: <Widget>[
			  Container(color: Colors.redAccent,),
			  CollapsingNavigationDrawer()
		  ],
	  ),
	  
	);
  }
}