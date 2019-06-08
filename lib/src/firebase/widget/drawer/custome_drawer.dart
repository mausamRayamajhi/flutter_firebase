import 'package:flutter/material.dart';

class CustomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black54,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text('mausam@495@gmail.com'),
              accountName: Text('Mausam Rayamajhi'),
            ),
            ListTile(
              onTap: () {
                Navigator.popAndPushNamed(context, '/add_cafe');
              },
              title: Text(
                'Add cafe',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              onTap: () {
                Navigator.popAndPushNamed(context, '/add_employe');
              },
              title: Text(
                'Add employe',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.popAndPushNamed(context, '/login');
              },
              title: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.popAndPushNamed(context, '/profile');
              },
              title: Text(
                'Profile',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
