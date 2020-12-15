import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:temp_project/screens/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
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
        global.errorCheck = 'Your number is already used';
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
      },
    );
  }
}
