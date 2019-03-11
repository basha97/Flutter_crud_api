import 'package:flutter/material.dart';
import 'package:flutter_crud/main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class EditData extends StatefulWidget {
	final List list;
	final int index;

	EditData({this.list, this.index});

	@override
	_EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {

	TextEditingController _name;
	TextEditingController _number;
	TextEditingController _email;

	void editData(){
		var url = "http://192.168.0.110/api/update_register_data";
    print(_name.text);
		http.post(url,body:{
			'id' : widget.list[widget.index]['id'].toString(),
			'name' : _name.text, 
			'number' : _number.text,
			'email' : _email.text
		});
	}

	@override
	void initState() {
    print(widget.list[widget.index]['name']);
		_name = TextEditingController(text: widget.list[widget.index]['name']);
		_number = TextEditingController(text: widget.list[widget.index]['number']);
		_email = TextEditingController(text: widget.list[widget.index]['email']);
    	super.initState();
  	}
    
	@override
	Widget build(BuildContext context) {
	return Scaffold(
     	appBar: new AppBar(
        	title: Text("EDIT DATA of ${widget.list[widget.index]["name"]}"),
      	),
     	body:Padding(
        	padding: const EdgeInsets.all(10.0),
        	child: ListView(
          	children: <Widget>[
            	new Column(
              		children: <Widget>[
                // new TextField(
                //   controller: cuid,
                //   decoration: new InputDecoration(
                //     hintText: "UID",
                //     labelText: "UID",
                //   ),
                // ),
                new TextField(
                  controller: _name,
                  decoration: new InputDecoration(
                    hintText: "Name",
                    labelText: "Name",
                  ),
                ),
                new TextField(
                  controller: _email,
                  decoration: new InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                  ),
                ),
                new TextField(
                  controller: _number,
                  decoration: new InputDecoration(
                    hintText: "Mobile",
                    labelText: "Mobile",
                  ),
                ),
                // new TextField(
                //   controller: cpassword,
                //   decoration: new InputDecoration(
                //     hintText: "Password",
                //     labelText: "Password",
                //   ),
                // ),
                new Padding(padding: EdgeInsets.all(10.0)),
                new RaisedButton(onPressed: (){
                  editData();
                  // Navigator.of(context).push(
                  //   new MaterialPageRoute(
                  //       builder: (BuildContext context)=>new Home()
                  //   ),
                  // );
                },
                  child: new Text("EDIT  Data"),
                  color: Colors.deepOrange,
                )

              ],
            ),
          ],
        ),
      ),

    );
  }
}