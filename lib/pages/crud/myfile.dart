// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:http/http.dart' as http;


// class Myfile extends StatefulWidget {
// 	const Myfile({Key key}): super(key:key);
// 	@override
// 	State<StatefulWidget> createState() {
// 		return _Myfile();
// 	}
// }



// class _Myfile extends State<Myfile> {
// 	final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// 	bool _agreedToTOS = true;

// 	@override
// 	Widget build(BuildContext context) {
// 		return
		
// 		 Form(
// 			key: _formKey,
// 			child: Column(
// 				crossAxisAlignment: CrossAxisAlignment.start,
// 				children: <Widget>[
// 					TextField(
// 						decoration: InputDecoration(
// 							labelText: 'Username'
// 						),
// 					),
// 					SizedBox(
// 						height: 16.0,
// 					),
// 					TextFormField(
// 						decoration: InputDecoration(
// 							labelText: 'Name'
// 						),
// 					),
// 					Padding(
// 						padding: EdgeInsets.symmetric(vertical: 16.0),
// 						child: Row(
// 							children: <Widget>[
// 								Checkbox(
// 									value: _agreedToTOS,
// 									onChanged: _setAgreedToTOS,
// 								),
// 								GestureDetector(
// 									onTap: () => _setAgreedToTOS(!_agreedToTOS),
// 									child: Text('I agree'),
// 								)
// 							],
// 						),
// 					),
// 					Row(
// 						children: <Widget>[
// 							Spacer(),
// 							OutlineButton(
// 								highlightedBorderColor: Colors.black,
// 								onPressed: _submittable() ? _submit : null,
// 								child: Text('Register'),
// 							)
// 						],
// 					)
// 				],
// 			),
// 		);
// 	}

// 	void _setAgreedToTOS(bool newValue) {
// 		setState(() {
// 		_agreedToTOS = newValue;
// 		});
// 	}

// 	bool _submittable() {
//     	return _agreedToTOS;
//   	}

// 	void _submit() {
//     	_formKey.currentState.validate();
//     	print('Form submitted');
//   	}
// }