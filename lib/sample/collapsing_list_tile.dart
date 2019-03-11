import 'package:flutter/material.dart';
import 'package:flutter_crud/theme.dart';

class CollapsingListTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final AnimationController animationController;

  CollapsingListTile({@required this.title,@required this.icon, @required this.animationController});
  _CollapsingListTileState createState() => _CollapsingListTileState();
}

class _CollapsingListTileState extends State<CollapsingListTile> {
  Animation<double> _widthAnimation,sizedBoxAnimation;

  @override
	void initState() {
    	super.initState();
		_widthAnimation = Tween<double>(begin: 250, end: 60).animate(widget.animationController);
    sizedBoxAnimation = Tween<double>(begin: 10, end: 60).animate(widget.animationController);
  	}

  @override
  Widget build(BuildContext context) {
    return Container(
          width: _widthAnimation.value,
          margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0 ),
          child: Row(
            children: <Widget>[
              Icon(widget.icon, color: Colors.white, size: 38.0,),
              SizedBox(width: sizedBoxAnimation.value),
              (_widthAnimation.value >= 220) ? Text(widget.title,style: listTileDefaultTextStyle ) : 
              Container()
            ],
          ),
    );
  } 
}