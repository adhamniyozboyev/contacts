import 'package:contacts/screens/contactDetail.dart';
import 'package:flutter/material.dart';
import 'package:contacts/screens/addContact.dart';
import 'package:contacts/screens/homePage.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomePage.routeName:
      return MaterialPageRoute(builder: (context) => HomePage());
    case AddContact.routeName:
      return MaterialPageRoute(builder: (context) => AddContact());

    case ContactDetail.routeName:
      return MaterialPageRoute(builder: (context) => ContactDetail());

    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('Not found'),
          ),
        ),
      );
  }
}
