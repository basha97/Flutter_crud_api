import 'package:flutter/material.dart';
import 'package:flutter_crud/config/network.dart';
import 'package:flutter_crud/pages/stackedicon/stakedicons.dart';
import 'package:flutter_crud/pages/welcomepage.dart';
import 'package:flutter_crud/widgets/drawer/naviationdrawer.dart';
import 'package:flutter_crud/widgets/toast/toast.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter_crud/pages/signup/signup.dart';
import 'package:flutter_crud/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';





class Loginui extends StatefulWidget {

	@override
	_LoginuiState createState() => _LoginuiState();
}

class _LoginuiState extends State<Loginui> {
//  void autoAuthenticate () async{
//    final SharedPreferences prefs = await  SharedPreferences.getInstance();
//    final String token = prefs.getString('token');
//    if(token != null){
//      final String name = prefs.getString('name');
//      final String email = prefs.getString('email');
//      final int id = prefs.getInt('id');
//      final int User_id = prefs.getInt('user_id');
//      _authUser = User(id: id, email: email, token: token,name: name);
//    }
//  }

  void logout() async{
    final SharedPreferences prefs = await  SharedPreferences.getInstance();
    prefs.clear();
  }

	static TextEditingController _username = TextEditingController();
	static TextEditingController _password = TextEditingController();

	  Future <Map<String, dynamic>> LoginFunc() async {
	    print(_username.text+':'+_password.text);
     final Map<String, dynamic> data = {
        "email" :_username.text,
        "password" :_password.text
      };
      http.Response response;

      response = await http.post(apiUrl+'/login',body: data).then((response) async {
        var value = json.decode(response.body);
        print(value);
        if (value['success'] == true) {
          var user = new User.fromJson(value);
          saveCurrentLogin(value);
//         final SharedPreferences prefs = await  SharedPreferences.getInstance();
//         prefs.setString('token', value['token']);
//         prefs.setString('email', value['email']);
//         prefs.setString('name', value['full_name']);
//         prefs.setInt('user_id', value['user_id']);
//         prefs.setInt('id', value['id']);
//         prefs.setString('status', value['status']);
//         prefs.setString('type', value['type']);
//          var token = value['token'];
//          var name = value['data']['username'];
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => NavigateDrawer()
            )
          );
        }else
        {
          final value = json.decode(response.body);
          saveCurrentLogin(value);
          return invalid_credential_msg();
          return null;
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
          StakedIcons(),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 0.0),
//          padding: EdgeInsets.all(10.0),
            child: TextField(

              controller: _username,
              decoration: InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(
                  gapPadding: 3.3,
                  borderRadius: BorderRadius.circular(6.6)
                )
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 0.0),
//          padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: _password,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                  border: OutlineInputBorder(
                      gapPadding: 3.3,
                      borderRadius: BorderRadius.circular(6.6)
                  )
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
                    child: GestureDetector(
                         onTap: () => LoginFunc(),
                        // onTap: () => Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => SplashScreen()
                        //   )
                          // ),
                        child: new Container(
                            alignment: Alignment.center,
                            height: 60.0,
                            decoration: new BoxDecoration(
                                color: Color(0xFF18D191),
                                borderRadius: new BorderRadius.circular(9.0)),
                            child: new Text("Login",
                                style: new TextStyle(
                                    fontSize: 20.0, color: Colors.white)))
                    ),
                    // child: RaisedButton(
                    //   onPressed: () => LoginFunc(),
										// 	textColor: Colors.redAccent,
										// 	child: Text("SignIn",
                    //   style: TextStyle(
                    //     fontSize: 20.0,
                    //     color : Color(0xFF18D191)
                    //   ),),
                    // ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 20.0, top: 10.0),
                  child: new Container(
                      alignment: Alignment.center,
                      height: 60.0,
                      child: new Text("Forgot Password?",
                          style: new TextStyle(
                              fontSize: 17.0, color: Color(0xFF18D191)))),
                ),
              )
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                  MaterialPageRoute(builder: (context) => SignUp())
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom:18.0),
                    child: new Text("Create an account ",style: new TextStyle(
                        fontSize: 17.0, color: Color(0xFF18D191),fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

}

saveCurrentLogin(Map value) async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  var name = (value != null && !value.isEmpty) ? User.fromJson(value).name : "";
  var token = (value != null && !value.isEmpty) ? User.fromJson(value).token : "";
  var email = (value != null && !value.isEmpty) ? User.fromJson(value).email : "";
  var id = (value != null && !value.isEmpty) ? User.fromJson(value).id : "";
}

getToken() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String getToken = await prefs.getString("LastToken");
  return getToken;
}

saveLogout() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('LastUser', "");
  await prefs.setString('LastToken', "");
  await prefs.setString('LastEmail', "");
  await prefs.setInt('LastUserId', 0);
}

Future<User> LogOutFunc(BuildContext context) async{
  var token;
  await getToken().then((result){
    token = result;
  });
  final response = await http.post(
      apiUrl+"/logout",
//      headers: {HttpHeaders.authorizationHeader: "Token $token"},
  headers: {
        "Authorization" : "Bearer $token"
  },

  );
  print(response.body);
  print(response.statusCode);
  print(response.headers);
  if(response.statusCode == 200 ){
    saveLogout();
    return null;
  }else{
    saveLogout();
    return null;
  }
}





 