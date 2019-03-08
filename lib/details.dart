import 'package:flutter/material.dart';
// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

class Details extends StatefulWidget {
	final dynamic list;
	final dynamic index;

	Details({this.list,this.index});
	_DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
	void confirm(){

	}
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("${widget.list[widget.index]['id']}"),
			),
			body: Container(
				child: Column(
					children: <Widget>[
						Text(
							widget.list[widget.index]['title'],
							style: TextStyle(fontSize: 20.0),
						),
						Text(
							widget.list[widget.index]['body'],
						),
						MaterialButton(
							child: Text("Editdsjbfsdh"),
							color: Colors.deepOrangeAccent,
							onPressed: (){},
						),
						MaterialButton(
							child: Text("Delete"),
							color: Colors.deepOrangeAccent,
							onPressed: ()=>confirm(),
						),
					],
				),
			),
		);
	}
}