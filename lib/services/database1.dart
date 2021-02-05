import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:temp_project/shared/phone.dart' as global;


class AddUser extends StatefulWidget {
  final String firstname;
  final String lastname;
  final String email;
  final String phone;

  AddUser(this.firstname, this.lastname, this.email, this.phone);

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  @override

  Widget build(BuildContext context) {
    final CollectionReference tempCollection =
        Firestore.instance.collection('DataSettest');
    // ignore: missing_return
    Future<void> adduser() {
      if (tempCollection.document(widget.phone) == null) {
        tempCollection.document(widget.phone).setData({
          'Users': {
            'FirstName ': widget.firstname,
            'LastName ': widget.lastname,
            'Email': widget.email,
            'Phone Number': widget.phone,
          }
        });
      }
       if (tempCollection.document(widget.phone) != null){
         setState(() {
           global.errorCheck = 'Your number is already used';
         });
        print(global.errorCheck);
       
      }
    }

    return RaisedButton(
      color: Colors.red[400],
      child: Text(
        'Submit',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () async {
        adduser();
        getData();
              },
            );
          }
        
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

