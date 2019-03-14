import 'package:flutter/material.dart';
import 'package:flutter_crud/config/network.dart';
import 'package:flutter_crud/widgets/toast/toast.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter_crud/widgets/splashscreen/splashscreen.dart';


class Loginui extends StatefulWidget {
	const Loginui({Key key}) : super(key:key);
	@override
	_LoginuiState createState() => _LoginuiState();
}

class _LoginuiState extends State<Loginui> {
	static TextEditingController _username = TextEditingController();
	static TextEditingController _password = TextEditingController();

	Future<Map> LoginFunc() async {
		print(_username.text+':'+_password.text);
		Map data = {
			"username" :_username.text,
			"password" :_password.text
		};
		
		await http.post(ApiUrl+'/login',body: data).then((response){
			var value = json.decode(response.body);
			print(value);
			if (value['status'] == true) {
				var token = value['token'];
				var name = value['data']['username'];
				Navigator.pushReplacement(
					context,
					MaterialPageRoute(
						builder: (context) => SplashScreen()
					)
				);
			}else
			{
				return invalid_credential_msg();
			}
		});
		
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
		body: 	Container(
					margin: EdgeInsets.symmetric(horizontal: 20.0),
					child: Column(
						mainAxisAlignment: MainAxisAlignment.spaceEvenly,
						children: <Widget>[
							Column(
								mainAxisAlignment: MainAxisAlignment.spaceAround,
								children: <Widget>[
									Container(
										decoration: BoxDecoration(
											border: Border(
												bottom: BorderSide(
													width: 0.5,
													color: Colors.redAccent
												)
											)
										),
										child: TextField(
											controller: _username,
											style: TextStyle(
												color: Colors.black
											),
											decoration: InputDecoration(
												icon: Icon(
													Icons.person_outline,
													color: Colors.black,
												),
												border: InputBorder.none,
												hintText: "Username",
												hintStyle: TextStyle(
													color: Colors.black,
													fontSize: 15.0
												),
												contentPadding: EdgeInsets.only(
													top: 30.0,
													right: 30.0,
													bottom: 30.0,
													left: 5.0
												)
											),
										),
									),
									Container(
										child: TextField(
												controller: _password,
												obscureText: true,
												style: TextStyle(
													color: Colors.black
												),
												decoration: InputDecoration(
													icon: Icon(
														Icons.lock,
														color: Colors.black,
													),
													border: InputBorder.none,
													hintText: "Password",
													hintStyle: TextStyle(
														color: Colors.black,
														fontSize: 15.0
													),
													contentPadding: EdgeInsets.only(
														top: 30.0,
														right: 30.0,
														bottom: 30.0,
														left: 5.0
													)
												),
										),
									),
									Container(
										child: RaisedButton(
											onPressed: () => LoginFunc(),
											textColor: Colors.redAccent,
											child: Text("SignIn"),
										),
									)
								]
							)
					],
				),
			),
		);
	}
}



 