import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temp_project/screens/authenticate/authenticate.dart';
import 'package:temp_project/models/user.dart';
import 'package:temp_project/screens/home/home0.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    if (user == null){
      return Authenticate();
    }else {
      return Choice();
    }   
  }
}