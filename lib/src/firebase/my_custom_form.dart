import 'package:firebasetest/src/firebase/cafe_list.dart';
import 'package:firebasetest/src/firebase/widget/drawer/custome_drawer.dart';
import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomeDrawer(),
      appBar: AppBar(
        title: Text('Firebase test'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'Cafe in town',
              style: TextStyle(
                fontSize: 30.0,
                letterSpacing: 1.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: CafeList(),
          )
        ],
      ),
    );
  }
}
