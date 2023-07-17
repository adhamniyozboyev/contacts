import 'package:contacts/models/contact.dart';
import 'package:contacts/screens/addContact.dart';
import 'package:flutter/material.dart';
import 'package:contacts/screens/homePage.dart';
import '../services/prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactDetail extends StatefulWidget {
  static const String routeName = '/contact';
  final Contacts contact;
  ContactDetail(this.contact, {super.key});

  @override
  State<ContactDetail> createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddContact.routeName);
              },
              icon: Icon(Icons.edit_outlined)),
          IconButton(
              onPressed: () async {
                await deleteContact(widget.contact.id);
                Navigator.pop(context);
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 90),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              height: 500,
              width: 420,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.greenAccent,
                    child: Text(widget.contact.name[0]),
                  ),
                  Text(
                    widget.contact.name,
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  Text('Telefon ${widget.contact.phoneNumber}'),
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    widget.contact.email,
                    style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.phone,
                              color: Colors.white,
                            )),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.message,
                              color: Colors.white,
                            )),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.purple,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.video_call_sharp,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
