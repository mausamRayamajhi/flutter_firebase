import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SelectedCafe extends StatelessWidget {
  final String cafeId;
  final dynamic data;
  SelectedCafe({this.cafeId, this.data});
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData.fallback(),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: () {
                Navigator.popAndPushNamed(
                  context,
                  '/add_employe',
                  arguments: cafeId,
                );
              },
              child: Icon(
                Icons.person_add,
              ),
            ),
          )
        ],
      ),
      body: Container(
        width: deviceSize.width,
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        // color: Colors.red,

        // height: deviceSize.height * 0.3,
        child: Column(
          children: <Widget>[
            Text(
              data['name'],
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              data['city'],
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              'Employee List',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Flexible(
              child: StreamBuilder(
                stream: Firestore.instance
                    .collection('employes')
                    .where('cafeId', isEqualTo: cafeId)
                    .orderBy('name')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: ClampingScrollPhysics(),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, index) => buildEmployee(
                        snapshot.data.documents[index].data,
                        deviceSize,
                        snapshot.data.documents[index].documentID),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  buildEmployee(result, Size deviceSize, String id) => Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Center(
              child: Material(
                elevation: 10.0,
                color: Colors.yellow[300],
                child: Container(
                  width: deviceSize.width * 0.8,
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        result['name'],
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        result['post'],
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 15.0,
            right: 35.0,
            child: GestureDetector(
              onTap: () {
                Firestore.instance.collection('employes').document(id).delete();
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
      );
}
