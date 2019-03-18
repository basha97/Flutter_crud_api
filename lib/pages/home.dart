import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_crud/pages/crud/adddata.dart';
import 'package:flutter_crud/pages/crud/deatils.dart';
import 'package:flutter_crud/widgets/loader/loader.dart';

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
                    child: Loader(),
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
