import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  static const String routeName = '/add';
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
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
    );
  }
}
