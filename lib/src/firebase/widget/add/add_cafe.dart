import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddCafe extends StatefulWidget {
  @override
  _AddCafeState createState() => _AddCafeState();
}

class _AddCafeState extends State<AddCafe> {
  final cafesNameController = TextEditingController();
  final cafesLocationController = TextEditingController();

  @override
  void dispose() {
    cafesNameController.dispose();
    cafesLocationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0.0,
          iconTheme: IconThemeData.fallback(),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.popAndPushNamed(context, '/add_employe');
                },
                child: Icon(
                  Icons.person_add,
                ),
              ),
            )
          ],
        ),
        body: Container(
          // color: Colors.red,
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Add Cafe',
                  style: TextStyle(
                    fontSize: 30.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                controller: cafesNameController,
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
              ),
              TextField(
                controller: cafesLocationController,
                decoration: InputDecoration(
                  hintText: 'Location ',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                onPressed: () {
                  var name = cafesNameController.text;
                  var city = cafesLocationController.text;
                  Firestore.instance.collection('cafes').add({
                    'name': name,
                    'city': city,
                  }).then((response) {
                    cafesNameController.clear();
                    cafesLocationController.clear();
                  });
                },
                child: Text('Add'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
