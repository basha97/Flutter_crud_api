import 'package:flutter/material.dart';
import 'package:flutter_crud/pages/home.dart';
import 'package:flutter_crud/pages/search.dart';
import 'package:flutter_crud/widgets/drawer/CollapsingNavigationDrawer.dart';
import 'package:flutter_crud/widgets/theme/theme.dart';
import 'dart:async';
import 'package:flutter_crud/pages/setting.dart';
import 'package:flutter_crud/pages/error.dart';
import 'package:flutter_crud/pages/notificationPage.dart';
import 'package:flutter_crud/widgets/loader/colorLoader5.dart';


void main() => runApp(MaterialApp(
      title: "My Store",
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        "/crud" : (BuildContext context) => Home(),
        "/setting" : (BuildContext context) => Setting(),
        "/search" : (BuildContext context) => Search(),
        "/notification" : (BuildContext context) => NotificationPage(),
        "/error" : (BuildContext context) => Error(), 
      },
      debugShowCheckedModeBanner: false,
    ));




class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 7),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => NavigateDrawer())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _splashBody());
  }

  Widget _splashBody() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.redAccent),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50.0,
                      child: FlutterLogo(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    Text(
                      "Cloudelabs",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ColorLoader5(),
                  // CircularProgressIndicator(
                  //   valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  Text(
                    "Ezfleets",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}


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



