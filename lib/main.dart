import 'package:flutter/material.dart';
import 'package:flutter_crud/pages/home.dart';
import 'package:flutter_crud/pages/login/login_ui.dart';
import 'package:flutter_crud/pages/search.dart';
import 'package:flutter_crud/pages/setting.dart';
import 'package:flutter_crud/pages/error.dart';
import 'package:flutter_crud/pages/notificationPage.dart';
import 'package:flutter_crud/widgets/splashscreen/splashscreen.dart';


void main() => runApp(MaterialApp(
      title: "My Store",
      home: Loginui(),
      routes: <String, WidgetBuilder>{
        "/crud" : (BuildContext context) => Home(),
        "/setting" : (BuildContext context) => Setting(),
        "/search" : (BuildContext context) => Search(),
        "/notification" : (BuildContext context) => NotificationPage(),
        "/error" : (BuildContext context) => Error(), 
      },
      debugShowCheckedModeBanner: false,
    ));










