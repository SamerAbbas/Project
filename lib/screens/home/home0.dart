import 'package:flutter/material.dart';

import 'home.dart';
import 'home2.dart';

class Choice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 0.0,
          title: Text('Choose Sign in method'),
        ),
        body: Container(
          padding: EdgeInsets.all(160),
          child: Form(
            child: Column(
              children: <Widget>[
                SizedBox(height: 50.0),
                RaisedButton(
                    color: Colors.red[400],
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home2(),
                          ));
                    }),
                SizedBox(height: 50.0),
                RaisedButton(
                    color: Colors.red[400],
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ));
                    }),
              ],
            ),
          ),
        ));
  }
}
