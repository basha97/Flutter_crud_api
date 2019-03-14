import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

invalid_credential_msg(){
	return Fluttertoast.showToast(
		msg: "Username and Password does not match",
		toastLength: Toast.LENGTH_SHORT,
		gravity: ToastGravity.BOTTOM,
		timeInSecForIos: 1,
		backgroundColor: Colors.blueAccent,
		textColor: Colors.white,
		fontSize: 16.0
	);
}