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
      
      await http.post(apiUrl+'/login',body: data).then((response){
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
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(color : Color(0xFF18D191)),
    ),
    body: Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 0.0),
            child: TextField(
              controller: _username,
              decoration: InputDecoration(
                labelText: "Username"
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 0.0),
            child: TextField(
              controller: _password,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,right: 5.0,top: 10.0
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color : Color(0xFF18D191),
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    // child: Text("Sigin",
                    // style: TextStyle(
                    //   fontSize: 20.0,
                    //   color : Color(0xFF18D191)
                    // ),),
                    child: RaisedButton(
                      onPressed: () => LoginFunc(),
											textColor: Colors.redAccent,
											child: Text("SignIn",
                      style: TextStyle(
                        fontSize: 20.0,
                        color : Color(0xFF18D191)
                      ),),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,right: 5.0,top: 10.0
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: 60.0,
                    child: Text("Forgor Password",
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.white
                    ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 18.0),
                  child: Text("Create a new account",style: TextStyle(
                    fontSize: 17.0,
                    color : Color(0xFF18D191),
                    fontWeight: FontWeight.bold
                  ),),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}


}
 