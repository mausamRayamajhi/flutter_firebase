import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddEmploye extends StatefulWidget {
  final String cafeId;
  AddEmploye({this.cafeId});
  @override
  _AddEmployeState createState() => _AddEmployeState();
}

class _AddEmployeState extends State<AddEmploye> {
  final cafesNameController = TextEditingController();
  final cafesLocationController = TextEditingController();
  String dropdownValue;

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
        ),
        body: Container(
          // color: Colors.red,
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Add Employe',
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
                  hintText: 'Post',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              StreamBuilder(
                stream: Firestore.instance.collection('cafes').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  List<DropdownMenuItem<String>> items = [];
                  snapshot.data.documents.forEach(
                    (DocumentSnapshot value) {
                      var data = value.data['name'];
                      items.add(
                        DropdownMenuItem(
                          child: Text(data),
                          value: value.documentID,
                        ),
                      );
                    },
                  );
                  return DropdownButton(
                    elevation: 4,
                    isExpanded: true,
                    hint: Text('Select cafe'),
                    value: dropdownValue != null
                        ? dropdownValue
                        : widget.cafeId != null ? widget.cafeId : null,
                    items: items.toList(),
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        dropdownValue = value;
                      });
                    },
                  );
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                onPressed: () {
                  var name = cafesNameController.text;
                  var city = cafesLocationController.text;

                  if (name != null && city != null && dropdownValue != null) {
                    Firestore.instance.collection('employes').add({
                      'name': name,
                      'post': city,
                      'cafeId': dropdownValue,
                    }).then((response) {
                      cafesNameController.clear();
                      cafesLocationController.clear();
                      dropdownValue = null;
                    });
                  } else {
                    print('Some error in fields');
                  }
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
