import 'package:flutter/material.dart';
import 'package:flutter_crud/pages/search.dart';
import 'dart:convert';
import 'package:flutter_crud/sample/CollapsingNavigationDrawer.dart';
import 'package:flutter_crud/theme.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter_crud/sample/adddata.dart';
import 'package:flutter_crud/sample/deatils.dart';
import 'package:flutter_crud/pages/setting.dart';
import 'package:flutter_crud/pages/error.dart';
import 'package:flutter_crud/pages/notificationPage.dart';

void main() => runApp(MaterialApp(
      title: "My Store",
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        "/crud" : (BuildContext context) => Home(),
        "/setting" : (BuildContext context) => Setting(),
        "/search" : (BuildContext context) => Search(),
        "/notification" : (BuildContext context) => NotificationPage(),
        "/error" : (BuildContext context) => Error(), 
      },
      debugShowCheckedModeBanner: false,
    ));

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  String url = 'https://jsonplaceholder.typicode.com/posts';
  String url1 = 'http://192.168.0.110/api/getData';
  Future<List<dynamic>> getData() async {
    final response = await http.get('$url1');
    print(response.body);
    var x = json.decode(response.body);
    return x['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cloudelabs"),
          backgroundColor: Colors.redAccent,
        ),
		
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => AddData(),
                ),
              ),
          child: Icon(Icons.add),
        ),
        body: Container(
          child: FutureBuilder<List<dynamic>>(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('Press button to start.');
                case ConnectionState.active:
                case ConnectionState.waiting:
                  // return Text('Awaiting result...');
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                  if (snapshot.hasError)
                    return Text('Error: ${snapshot.error}');
                  return ItemList(list: snapshot.data);
                // return Text(snapshot.data);
              }
              return null; // unreachable
            },
          ),
        ));
  }
}

class ItemList extends StatelessWidget {
  final List<dynamic> list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int i) => Divider(
            color: Colors.grey,
          ),
      itemCount: list.length,
      itemBuilder: (context, i) {
        // if (i.isEven) return Divider();
        return ListTile(
          contentPadding: EdgeInsets.all(15.0),
          title: Text(
            list[i]['name'],
            style: TextStyle(fontSize: 25, color: Colors.cyan),
          ),
          leading: CircleAvatar(
            backgroundImage: new NetworkImage(
                'https://cdn3.vectorstock.com/i/1000x1000/30/97/flat-business-man-user-profile-avatar-icon-vector-4333097.jpg'),
          ),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    Details(list: list, index: i),
              )),
        );
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 7),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => NavigateDrawer())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _splashBody());
  }

  Widget _splashBody() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.redAccent),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50.0,
                      child: FlutterLogo(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    Text(
                      "Cloudelabs",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  Text(
                    "Ezfleets",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}


class NavigateDrawer extends StatefulWidget {
  @override
  _NavigateDrawerState createState() => _NavigateDrawerState();
}

class _NavigateDrawerState extends State<NavigateDrawer> {
  @override
  Widget build(BuildContext context) {
	return Scaffold(
	  appBar: AppBar(
		  elevation: 0.0,
		  backgroundColor: drawerBackgroundColor,
		  title: Text("Navbar"),
	  ),
	  body: Stack(
		  children: <Widget>[
			  Container(color: Colors.redAccent,),
			  CollapsingNavigationDrawer()
		  ],
	  ),
	  
	);
  }
}



