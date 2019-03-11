import 'package:flutter/material.dart';


class NavigationModel {
	String title;
	IconData icon;

	NavigationModel({this.title,this.icon});

}

	List<NavigationModel> navigationItems = [
		NavigationModel(title: "DashBoard",icon: Icons.insert_chart),
		NavigationModel(title: "Errors",icon: Icons.error),
		NavigationModel(title: "Search",icon: Icons.search),
		NavigationModel(title: "Notifications",icon: Icons.notifications),
		NavigationModel(title: "Setting",icon: Icons.settings),
	];
