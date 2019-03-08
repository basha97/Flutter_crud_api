import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter_crud/sample/adddata.dart';
import 'package:flutter_crud/sample/deatils.dart';

void main()=>runApp( MaterialApp(
  title: "My Store",
  home:  Home(),
  debugShowCheckedModeBanner: false,
));

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return  HomeState();
  }
}
class HomeState extends State<Home>{
	String url = 'https://jsonplaceholder.typicode.com/posts';
	String url1 = 'http://192.168.0.110/api/getData';
	Future<List<dynamic>> getData() async{

	final response = await http.get('$url');
	// dynamic n = json.decode(response.body);
	// dynamic sample = n['data'];
	// print(sample);
	print(response.body);
	return json.decode(response.body);
	}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title:  Text("My Store"),
      ),

      floatingActionButton:  FloatingActionButton(
          onPressed: ()=>Navigator.of(context).push(
             MaterialPageRoute(
                builder: (BuildContext context)=> AddData(),
            ),
          ),
          child:  Icon(Icons.add),
      ),
      body:  Container(
		  child: FutureBuilder<List<dynamic>>(
			future: getData(),
			builder: (BuildContext context, AsyncSnapshot snapshot) {
				switch (snapshot.connectionState) {
				case ConnectionState.none:
					return Text('Press button to start.');
				case ConnectionState.active:
				case ConnectionState.waiting:
					return Text('Awaiting result...');
				case ConnectionState.done:
					if (snapshot.hasError)
					return Text('Error: ${snapshot.error}');
					 return ItemList(list: snapshot.data);
					// return Text(snapshot.data);
				}
				return null; // unreachable
			},
		),
	  )
    );
  }
}
class ItemList extends StatelessWidget{

  final List<dynamic> list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: list.length,
      	itemBuilder: (context,i){
          return  ListTile(
            title:  Text(
				list[i]['title']
				),
            leading:  Icon(Icons.add),
            onTap:()=> Navigator.of(context).push(
               MaterialPageRoute(
                  builder: (BuildContext context)=> Details(list: list,index: i),

              )
            ),
          );
      },
    );
  }
}