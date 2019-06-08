import 'package:firebasetest/src/firebase/single_item.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CafeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('cafes').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          itemCount: snapshot.data.documents.length,
          itemBuilder: (BuildContext context, index) {
            return SingleItem(
              data: snapshot.data.documents[index].data,
              id: snapshot.data.documents[index].documentID,
            );
          },
        );
      },
    );
  }
}
