import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SingleItem extends StatelessWidget {
  final dynamic data;
  final String id;
  SingleItem({this.data, this.id});
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/selectedCafe',
              arguments: <String, dynamic>{'id': id, 'data': data});
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Center(
            child: Material(
              elevation: 10.0,
              color: Colors.yellow[300],
              child: Container(
                width: deviceSize.width * 0.8,
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            data['name'],
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            data['city'],
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 5.0,
                      right: 10.0,
                      child: GestureDetector(
                        onTap: () {
                          Firestore.instance
                              .collection('cafes')
                              .document(id)
                              .delete();
                        },
                        child: Container(
                          child: Text(
                            'X',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
