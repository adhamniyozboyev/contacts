import 'package:contacts/models/contact.dart';
import 'package:contacts/screens/addContact.dart';
import 'package:contacts/screens/contactDetail.dart';
import 'package:contacts/services/prefs.dart';
import 'package:flutter/material.dart';
import 'package:contacts/services/prefs.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddContact'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddContact.routeName);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
        future: getContacts(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          }
          List<Contacts> contacts = snapshot.data!;
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, ContactDetail.routeName,
                            arguments: contacts[index])
                        .then((value) {
                      print(value);
                      setState(() {});
                    });
                  },
                  leading: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 253, 197, 112),
                      child: Text(contacts[index].name[0])),
                  title: Text(contacts[index].name),
                );
              });
        },
      ),
    );
  }
}
