import 'package:flutter/material.dart';

class User {
  final int id ;
  final String email;
  final String token;
  final String name;

  User({@required this.id,@required this.email,@required this.token,@required this.name});
}