import 'package:flutter/material.dart';
import 'package:flutter_crud/pages/login/login_ui.dart';
import 'package:flutter_crud/widgets/toast/toast.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    radius: 50.0,
                    child: FlutterLogo(),
                  )
                ],
              ),
              SizedBox(
                height: 60.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Loginui() )),
                        child: Container(
                          alignment: Alignment.center,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF18D191),
                            borderRadius: BorderRadius.circular(9.0)
                          ),
                          child: Text("SignIn with email",
                          style: TextStyle(
                            fontSize: 20.0, color: Colors.white
                          ),),
                        )
                      ),
                    ),
                  ),

                ],

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: () => coming_soon_msg(),
                          child: Container(
                            alignment: Alignment.center,
                            height: 40.0,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(9.0)
                            ),
                            child: Text("Facebook",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white
                              ),),
                          )
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: () => coming_soon_msg(),
                          child: Container(
                            alignment: Alignment.center,
                            height: 40.0,
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(9.0)
                            ),
                            child: Text("Google",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white
                              ),),
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ],

          ),

        ),
    );
  }
}
