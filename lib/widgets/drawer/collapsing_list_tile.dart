import 'package:flutter/material.dart';
import 'package:flutter_crud/widgets/theme/theme.dart';

class CollapsingListTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final String routePage;
  final AnimationController animationController;
  final bool isSelecetd;
  final Function onTap;

  CollapsingListTile({@required this.title,@required this.icon, @required this.animationController,this.isSelecetd = false,this.onTap,this.routePage});
  _CollapsingListTileState createState() => _CollapsingListTileState();
}

class _CollapsingListTileState extends State<CollapsingListTile> {
  Animation<double> _widthAnimation,sizedBoxAnimation;

  @override
	void initState() {
    	super.initState();
		_widthAnimation = Tween<double>(begin: 230, end: 65).animate(widget.animationController);
    sizedBoxAnimation = Tween<double>(begin: 10, end: 0).animate(widget.animationController);
  	}

  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: widget.onTap ,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(14.0)),
              color: widget.isSelecetd ? Colors.transparent.withOpacity(0.3) : Colors.transparent 
            ),
            width: _widthAnimation.value,
            margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0 ),
            padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
            child: Row(
              children: <Widget>[
                Icon(widget.icon, color: widget.isSelecetd ? selectedColor :  Colors.white, size: 25.0,),
                SizedBox(width: sizedBoxAnimation.value),
                (_widthAnimation.value >= 220) ? Text(
                  widget.title,
                  style: widget.isSelecetd ? listTileSelectedTextStyle : listTileDefaultTextStyle
                   ) : 
                Container()
              ],
            ),
      ),
    );
  } 
}