// import 'package:contacts/models/contact.dart';
// import 'package:contacts/screens/contactDetail.dart';
// import 'package:flutter/material.dart';
// import 'package:contacts/screens/addContact.dart';
// import 'package:contacts/screens/homePage.dart';
// import 'package:contacts/services/prefs.dart';
// Route onGenerateRoute(RouteSettings settings) {
//   switch (settings.name) {
//     case HomePage.routeName:
//       return MaterialPageRoute(builder: (context) => HomePage());
//     case AddContact.routeName:
//       return MaterialPageRoute(
//           builder: (context) => AddContact(:settings.arguments as Contacts));

//     case ContactDetail.routeName:
//       return MaterialPageRoute(
//           builder: (context) => ContactDetail(settings.arguments as Contacts));

//     default:
//       return MaterialPageRoute(
//         builder: (context) => Scaffold(
//           body: Center(
//             child: Text('Not found'),
//           ),
//         ),
//       );
//   }
// }

import 'package:flutter/material.dart';
import 'package:contacts/models/contact.dart';
import 'package:contacts/screens/addContact.dart';
import 'package:contacts/screens/contactDetail.dart';
import 'screens/homePage.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomePage.routeName:
      return MaterialPageRoute(builder: (context) => HomePage());
    case AddContact.routeName:
      return MaterialPageRoute(
          builder: (context) => AddContact(
               contact: settings.arguments as Contacts?, 
                //index: (settings.arguments as Map)['index'],
                //contact: (settings.arguments as Map)['contact'],
              ));
    case ContactDetail.routeName:
      return MaterialPageRoute(
          builder: (context) => ContactDetail(settings.arguments as Contacts

              // (settings.arguments as Map)['contact'],
              // (settings.arguments as Map)['index'])
              ));
    // case SecondPage.routeName:
    //   return MaterialPageRoute(
    //       builder: (context) => SecondPage(settings.arguments as int));

    // case ThirdPage.routeName:
    //   return MaterialPageRoute(builder: (context) => ThirdPage());
    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                body: Center(child: Text('Not found')),
              ));
  }
}
