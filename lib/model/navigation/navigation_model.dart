import 'package:flutter/material.dart';
import 'package:flutter_crud/pages/home.dart';
import 'package:flutter_crud/pages/notificationPage.dart';
import 'package:flutter_crud/pages/search.dart';
import 'package:flutter_crud/pages/setting.dart';
import 'package:flutter_crud/pages/error.dart';

void main() {
  runApp(MaterialApp(
    home: NavigationModel(),
    routes: <String, WidgetBuilder>{
        "/crud" : (context) => Home(),
        "/setting" : (context) => Setting(),
        "/search" : (context) => Search(),
        "/notification" : (context) => NotificationPage(),
        "/error" : (context) => Error(), 
      },
  ));
}
class NavigationModel extends StatefulWidget {
  String title;
	IconData icon;
  dynamic routePage;
  Function onTap;

	NavigationModel({this.title,this.icon,this.routePage,this.onTap});
  
  @override
  _NavigationModelState createState() => _NavigationModelState();
}

class _NavigationModelState extends State<NavigationModel> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

List<NavigationModel> navigationItems = [
		NavigationModel(title: "DashBoard",icon: Icons.insert_chart, routePage: "/crud"),
		NavigationModel(title: "Errors",icon: Icons.error, routePage: "/error"),
		NavigationModel(title: "Search",icon: Icons.search, routePage: "/search"),
		NavigationModel(title: "Notifications",icon: Icons.notifications, routePage: "/notification"),
		NavigationModel(title: "Setting",icon: Icons.settings, routePage: "/setting"),
	];
