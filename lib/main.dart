import 'package:firebasetest/src/firebase/bloc/login_bloc.dart';
import 'package:firebasetest/src/firebase/my_custom_form.dart';
import 'package:firebasetest/src/firebase/widget/routes/custome_routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await FirebaseApp.configure(
      name: 'firebasetest',
      options: FirebaseOptions(
        googleAppID: '1:340450376597:android:31a4273dc756635e',
        apiKey: 'AIzaSyBDHUjHeHX59nje6RZotID2z9i3thPibR4',
        databaseURL: 'https://avian-bricolage-214808.firebaseio.com',
      ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginBloc>.value(
          value: LoginBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Retrieve Text Input',
        home: SafeArea(
          child: MyCustomForm(),
        ),
        routes: Routes.buildRoutesWithoutArg(),
        onGenerateRoute: Routes.buildRouteWithArguments,
      ),
    );
  }
}
