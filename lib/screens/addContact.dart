import 'package:contacts/models/contact.dart';
import 'package:contacts/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/prefs.dart';

class AddContact extends StatelessWidget {
  static const String routeName = '/add';
  final Contacts? contact;
  AddContact({this.contact, super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Contacts newContact =
        contact ?? Contacts(id: -1, name: '', phoneNumber: '', email: '');
    var media = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('AddContact'),
      ),
      body: Container(
        width: media.size.width*1.1,
        height: media.size.height*0.7,
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 2) {
                      return 'Enter name ';
                    }
                    newContact.name = value[0].toUpperCase() +
                        value.substring(1).toLowerCase();
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      helperText: 'name'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 30),
                  child: TextFormField(
                    maxLength: 9,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 9) {
                        return 'Enter correct phoneNumber ';
                      }
                      newContact.phoneNumber = value;

                      return null;
                    },
                    decoration: InputDecoration(
                        prefixText: '+998',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        helperText: 'phoneNumber'),
                  ),
                ),
                TextFormField(
                  readOnly: false,
                  validator: (value) {
                    // int a =value.toString().indexOf('@.');
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains('@') ||
                        !value.contains('.')) {
                      return 'Enter correct email ';
                    }
                    newContact.email = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      helperText: 'email'),
                ),
                SizedBox(
                  height: 400,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel')),
                    TextButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await addContact(newContact);
                            Navigator.pushNamedAndRemoveUntil(
                                context, HomePage.routeName, (route) => false);
                          }
                        },
                        child: Text('Save'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
