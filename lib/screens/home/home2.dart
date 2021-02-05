import 'package:flutter/material.dart';
import 'package:temp_project/services/userCheck.dart';
import 'package:temp_project/shared/constants.dart';
import 'package:temp_project/shared/phone.dart' as global;


class Home2 extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home2> {
 
  final _formKey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text('Sign in'),
          backgroundColor: Colors.red,
          elevation: 0.0,
          actions: <Widget>[
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
                          Text(
                            'Enter your phone number',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
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
                                global.phone = val;
                              });
                            },
                          ),
                          UserInformation(),
                        ]),
                      )),
                ]),
              ),
            );
          },
        ));
  }
}
