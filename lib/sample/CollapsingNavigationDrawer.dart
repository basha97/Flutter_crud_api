import 'package:flutter/material.dart';
import 'package:flutter_crud/model/navigation_model.dart';
import 'package:flutter_crud/sample/collapsing_list_tile.dart';
import 'package:flutter_crud/theme.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  _CollapsingNavigationDrawerState createState() => _CollapsingNavigationDrawerState();
}

class _CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer> with SingleTickerProviderStateMixin {
	double maxwidth = 250;
	double minwidth = 60;
	bool isCollapsed = false ;
	AnimationController _animationController;
	Animation<double> _widthAnimation;

	@override
	void initState() {
    	super.initState();
		_animationController = AnimationController(
			vsync: this, duration: Duration(microseconds: 1000)
		);
		_widthAnimation = Tween<double>(begin: maxwidth, end: minwidth).animate(_animationController);
  	}

	@override
	Widget build(BuildContext context) {
		return AnimatedBuilder(
			animation: _animationController, builder: (context, widget) => getWidget(context , widget));
	}

	Widget getWidget(context , widget){
		return Container(
			width: _widthAnimation.value,
			color: drawerBackgroundColor,
			child: Column(
				children: <Widget>[
					
					CollapsingListTile(
						title: "Basha",
						icon: Icons.person,
						animationController: _animationController,
					),
					Expanded(
						child: ListView.separated(
						separatorBuilder: (context , counter){
							return Divider(color: Colors.grey,height: 40.0);
						},
						itemCount: navigationItems.length,
						itemBuilder: (context , counter )
							{
								return CollapsingListTile(
									title: navigationItems[counter].title,
									icon: navigationItems[counter].icon,
									animationController: _animationController
								);
							}
						),
					),
					 InkWell(
						 	onTap: () {
								 setState(() {
									 isCollapsed = !isCollapsed;
									 isCollapsed ? _animationController.forward() : _animationController.reverse();
								 });
							 },
							child: AnimatedIcon(
								icon:AnimatedIcons.close_menu,
								color: Colors.white,
								size: 50.0,
								progress: _animationController)
						),
					 SizedBox(height: 50.0),
				],
			),
		);
	}
}