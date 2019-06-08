import 'package:firebasetest/src/firebase/screens/login.dart';
import 'package:firebasetest/src/firebase/screens/profile.dart';
import 'package:firebasetest/src/firebase/selected_cafe.dart';
import 'package:firebasetest/src/firebase/widget/add/add_cafe.dart';
import 'package:firebasetest/src/firebase/widget/add/add_employe.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> buildRoutesWithoutArg() {
    return {
      '/add_cafe': (BuildContext context) => AddCafe(),
      '/login': (BuildContext context) => Login(),
      '/profile': (BuildContext context) => Profile(),
    };
  }

  static Route buildRouteWithArguments(RouteSettings settings) {
    dynamic arg = settings.arguments;
    switch (settings.name) {
      case '/selectedCafe':
        return MaterialPageRoute(
          builder: (BuildContext context) => SafeArea(
                child: SelectedCafe(
                  cafeId: arg['id'],
                  data: arg['data'],
                ),
              ),
        );
        break;

      case '/add_employe':
        return MaterialPageRoute(
          builder: (BuildContext context) => AddEmploye(
                cafeId: arg,
              ),
        );
        break;

      default:
        return null;
    }
  }
}
