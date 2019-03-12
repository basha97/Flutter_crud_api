import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {

	TextEditingController  cusername=new TextEditingController();
	TextEditingController  cpassword=new TextEditingController();
	TextEditingController  cname=new TextEditingController();
	TextEditingController  cemail=new TextEditingController();
	TextEditingController  cnumber=new TextEditingController();
	TextEditingController  cage=new TextEditingController();
	

   addData() async{

	var url="http://192.168.0.110/api/saveData";

	final dynamic res = http.post(
						url,
						body: {
							"age":cage.text,
							"name":cname.text,
							"number":cnumber.text,
							"username":cusername.text,
							"email":cemail.text,
							"password":cpassword.text
						}
					).then((http.Response response){
						print(response.body);
						final Map msg = json.decode(response.body);
						if (msg['message'] == "same username") {
						  	return Fluttertoast.showToast(msg: 'Username already exist!!');
						}
						if (msg['message'] == "same email") {
						  	return Fluttertoast.showToast(msg: 'Email already exist!!');
						}
						final int statusCode = response.statusCode;
						if (statusCode < 200 || statusCode > 400 || json == null) {
							throw new Exception('error');
							}
						return Fluttertoast.showToast(
								msg: "Data Added successfully",
								toastLength: Toast.LENGTH_SHORT,
								gravity: ToastGravity.BOTTOM,
								timeInSecForIos: 1,
								backgroundColor: Colors.pinkAccent,
								textColor: Colors.white,
								fontSize: 16.0
							);
					});
   }
	
  	@override
  	Widget build(BuildContext context) {
		return Scaffold(
			appBar: new AppBar(
				title: new Text("Add Data"),
			),
			body: Padding(
				padding:const EdgeInsets.all(1.0),
				child:ListView(
				children: <Widget>[
					new Column(
					children: <Widget>[
						new TextField(
							controller: cname,
							decoration: new InputDecoration(
								hintText: "Name",
								labelText: "Name",
							),
						),

					new TextField(
					controller: cage,
					decoration: new InputDecoration(
						hintText: "Age",
						labelText: "Age",
					),
					),

					new TextField(
					controller: cusername,
					decoration: new InputDecoration(
						hintText: "Username",
						labelText: "Username",
					),
					),

					
					new TextField(
					controller: cemail,
					decoration: new InputDecoration(
						hintText: "Email",
						labelText: "Email",
					),
					),
					new TextField(
					controller: cnumber,
					decoration: new InputDecoration(
						hintText: "Mobile",
						labelText: "Mobile",
					),
					),
					new TextField(
					controller: cpassword,
          obscureText: true,
					decoration: new InputDecoration(
						hintText: "Password",
						labelText: "Password",
            
					),
					),
					new Padding(padding: EdgeInsets.all(10.0)),
					new RaisedButton(onPressed: (){
					addData();
					// 
					print('data sent');
					},
					child: new Text("Add Data"),
					color: Colors.deepOrange,
					)

				],
				),
			],
			),
		)
		);
  	}
}

