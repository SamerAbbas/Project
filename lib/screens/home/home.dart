import 'package:flutter/material.dart';
import 'package:temp_project/services/auth.dart';
import 'package:temp_project/services/database1.dart';
import 'package:temp_project/shared/constants.dart';
import 'package:temp_project/shared/phone.dart' as global;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
  void getData() async {
    try {
      Response response = await Dio().post("http://hitoniot.com/public/api/getData", data: {'company_id': '22','factory_id' : '24', "date_from":"2020-11-8 12:30:00", "date_to":"2020-11-9 12:55:00", "device_id" :'77'} );
      var data_raw = response.data["data"];

      print(response.data[data_raw.length-1]['transaction_datetime']);
      print(response.data["data"][data_raw.length-1]['value']);
    } catch (e) {
      print(e);
    }
  }
}

class _HomeState extends State<Home> {
  final CollectionReference tempCollection =
      Firestore.instance.collection('DataSettest');

  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();

  String email = '';
  String firstname = '';
  String lastname = '';
  String phone = '';
  String error = global.errorCheck;
  var user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text('Register'),
          backgroundColor: Colors.red,
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Go Back'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: Column(children: [
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 50.0),
                      child: Form(
                        key: _formKey,
                        child: Column(children: <Widget>[
                          SizedBox(height: 20.0),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'First Name'),
                            validator: (val) =>
                                val.isEmpty ? 'Enter your First Name' : null,
                            onChanged: (val) {
                              setState(() {
                                firstname = val;
                              });
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Last Name'),
                            validator: (val) =>
                                val.isEmpty ? 'Enter your Last Name' : null,
                            onChanged: (val) {
                              setState(() {
                                lastname = val;
                              });
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Contact Number'),
                            validator: (val) => val.length == 10
                                ? null
                                : 'Enter a valid Phone Number',
                            onChanged: (val) {
                              setState(() {
                                phone = val;
                              });
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            decoration:
                                textInputDecoration.copyWith(hintText: 'Email'),
                            validator: (val) =>
                                val.isEmpty ? 'Enter an Email' : null,
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                          ),
                          AddUser(
                            firstname,
                            lastname,
                            email,
                            phone,
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            global.errorCheck,
                            style: TextStyle(color: Colors.red, fontSize: 14.0),
                          )
                        ]),
                      )),
                ]),
              ),
            );
          },
        ));
  }
}
