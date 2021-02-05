import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:temp_project/shared/loading.dart';
import 'package:temp_project/shared/phone.dart' as global;
import 'package:intl/intl.dart';



// ignore: must_be_immutable
class UserInformation extends StatelessWidget {
  CollectionReference tempCollection = Firestore.instance.collection('DataSet');

  bool loading = false;

  @override
  DateTime now = DateTime.now();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  Widget build(BuildContext context) {
    // ignore: missing_return
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
            onPressed:() async{
              //if (tempCollection.document(widget.phone) == null){
           print (DateTime);
            getData();
            
            });
              }
              
            
               getData() async {
    try {
      Response response = await Dio().post("https://hitoniot.com/public/api/getData", data: {'company_id': '22','factory_id' : '24', "date_from":"2020-11-8 12:30:00", "date_to":"2020-11-9 12:55:00", "device_id" :'77'} );
      var data_raw = response.data["data"];

      print(response.data[data_raw.length-1]['transaction_datetime']);
      print(response.data["data"][data_raw.length-1]['value']);
    } catch (e) {
      print(e);
    }
  }
}


