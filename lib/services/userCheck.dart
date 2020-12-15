import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:temp_project/shared/loading.dart';
import 'package:temp_project/shared/phone.dart' as global;

class UserInformation extends StatelessWidget {
  CollectionReference tempCollection = Firestore.instance.collection('DataSet');

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Future<void> test() {
      Firestore.instance
          .collection('DataSettest')
          .document(global.phone)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          print('Document exists on the database');
        } else {
          print('Error');
        }
      });
    }

    return loading
        ? Loading()
        : FlatButton(
            color: Colors.red[400],
            child: Text(
              'Sign in',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: test,
          );
  }
}
