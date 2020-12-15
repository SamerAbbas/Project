import 'package:cloud_firestore/cloud_firestore.dart';

class Info {
  String firstname;
  String lastname;
  String phonenum;
  String email;


Info.fromMap(Map<String, dynamic> data){
  firstname = data['FirstName'];
  lastname = data['LastName'];
  phonenum = data['Phone Number'];
  email = data['Email'];
}
}