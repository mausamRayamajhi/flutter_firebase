import 'package:firebasetest/src/firebase/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = Provider.of<LoginBloc>(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            //color: Colors.red,
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: 'Username',
                  ),
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password ',
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  onPressed: () {
                    String username = usernameController.text;

                    String password = passwordController.text;

                    loginBloc.enterPassword(password);
                    loginBloc.enterUsername(username);

                    if (username.length > 0 && password.length > 0) {
                      Navigator.pushNamed(context, '/profile');
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: new Text("Login error"),
                              content: Text('Enter username and password.'),
                              actions: <Widget>[
                                new FlatButton(
                                  child: new Text("Close"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                      );
                    }
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
