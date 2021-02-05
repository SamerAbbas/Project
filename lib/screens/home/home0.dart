import 'package:flutter/material.dart';
import 'home.dart';
import 'home2.dart';
import 'package:dio/dio.dart';

class Choice extends StatelessWidget {
  @override
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

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 0.0,
          title: Text('Choose Sign in method'),
        ),
        body: new LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: Column(                  
                  children: [
                  Container(
                    alignment: Alignment.center,                  
                    child: Form(                      
                      child: Column(                                              
                        children: <Widget>[                          
                          SizedBox(height: 100.0, width: 500),
                          RaisedButton(   
                            padding: EdgeInsets.fromLTRB(75, 50, 75, 50),                         
                              color: Colors.red[400],
                              child: Text(
                                'Sign In',
                                style: TextStyle(color: Colors.white, fontSize:20.0),
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
                            padding: EdgeInsets.fromLTRB(75, 50, 75, 50),  
                              color: Colors.red[400],
                              child: Text(
                                'Register',
                                style: TextStyle(color: Colors.white, fontSize:20.0),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Home(),
                                    ));
                              }),
                              SizedBox(height: 50.0),
                          RaisedButton(
                            padding: EdgeInsets.fromLTRB(75, 50, 75, 50),  
                              color: Colors.red[400],
                              child: Text(
                                'Register',
                                style: TextStyle(color: Colors.white, fontSize:20.0),
                              ),
                              onPressed: () {
                                getData();

                              }),
                        ],
                      ),
                    ),
                  )
                ]),
              ),
            );
          },
        ));
  }
}
