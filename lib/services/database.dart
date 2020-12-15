import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference tempCollection =
      Firestore.instance.collection('Owners');

  Future updateUserData(String firstname, String lastname, String email,
      String phone, String temp) async {
    return await tempCollection.document(uid).setData({
      'First Name': firstname,
      'Last Name': lastname,
      'Email': email,
      'Conatact Number': phone,
      'Last Temperature': temp,
    });
  }
}
