import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {

  TextEditingController  cage=new TextEditingController();
  TextEditingController  cname=new TextEditingController();
  TextEditingController  cusername=new TextEditingController();
  TextEditingController  cemail=new TextEditingController();
  TextEditingController  cmobile=new TextEditingController();
  TextEditingController  cpassword=new TextEditingController();

   addData() async{

    var url="http://192.168.0.110/api/saveData";
     http.post(url,body: {
      "age":cage.text,
      "name":cname.text,
      "number":cmobile.text,
      "username":cusername.text,
      "email":cemail.text,
      "password":cpassword.text
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
                  controller: cmobile,
                  decoration: new InputDecoration(
                    hintText: "Mobile",
                    labelText: "Mobile",
                  ),
                ),
                new TextField(
                  controller: cpassword,
                  decoration: new InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                  ),
                ),
                new Padding(padding: EdgeInsets.all(10.0)),
                new RaisedButton(onPressed: (){
                  addData();
                  Navigator.of(context).pop();
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