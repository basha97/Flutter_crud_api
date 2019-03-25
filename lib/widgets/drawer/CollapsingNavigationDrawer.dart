import 'package:flutter/material.dart';
import 'package:flutter_crud/model/navigation/navigation_model.dart';
import 'package:flutter_crud/pages/login/login_ui.dart';
import 'package:flutter_crud/widgets/drawer/collapsing_list_tile.dart';
import 'package:flutter_crud/widgets/theme/theme.dart';
import 'package:flutter_crud/pages/welcomepage.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  _CollapsingNavigationDrawerState createState() =>
      _CollapsingNavigationDrawerState();
}

class _CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxwidth = 230;
  double minwidth = 65;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> _widthAnimation;
  int currentSelectedIndex = 0;
  dynamic routes;

  void _navigationPart(counter){
	  setState(() {
		  print(navigationItems[counter].routePage);
      currentSelectedIndex = counter;
		//   Navigator.of(context).push(navigationItems[counter].routePage);
		Navigator.pushNamed(context,navigationItems[counter].routePage );
    
	  });
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(microseconds: 1000));
    _widthAnimation = Tween<double>(begin: maxwidth, end: minwidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, widget) => getWidget(context, widget));
  }

  Widget getWidget(context, widget) {
    return Material(
      elevation: 8.0,
      child: Container(
        width: _widthAnimation.value,
        color: drawerBackgroundColor,
        child: Column(
          children: <Widget>[
            CollapsingListTile(
              title: "Basha",
              icon: Icons.person,
              animationController: _animationController,
            ),
            Divider(
              color: Colors.grey,
              height: 5.0,
            ),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, counter) {
                    return Divider(height: 12.0);
                  },
                  itemCount: navigationItems.length,
                  itemBuilder: (context, counter) {
                    return CollapsingListTile(
                        onTap: () {
						              	_navigationPart(counter);
                        //   routes = navigationItems[counter].routePage;
                        //   print(routes);
                        //   Navigator.of(context).push(routes);
                          // setState(() {
                          //   currentSelectedIndex = counter;
                          // });
                        },
                        isSelecetd: currentSelectedIndex == counter,
                        title: navigationItems[counter].title,
                        icon: navigationItems[counter].icon,
                        animationController: _animationController);
                  }),
            ),
            Divider(
              color: Colors.grey,
              height: 40.0,
            ),
            CollapsingListTile(
              title: "Logout",
              icon: Icons.restore_from_trash,
              animationController: _animationController,
              onTap: () =>  LogOutFunc(context),
            ),
            InkWell(
                onTap: () {
                  //  Route route =MaterialPageRoute(builder: (context) => Home());
                  //  Navigator.push(context, route);
                  setState(() {
                    isCollapsed = !isCollapsed;
                    isCollapsed
                        ? _animationController.forward()
                        : _animationController.reverse();
                  });
                },
                child: AnimatedIcon(
                    icon: AnimatedIcons.close_menu,
                    color: Colors.white,
                    size: 50.0,
                    progress: _animationController)),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}


