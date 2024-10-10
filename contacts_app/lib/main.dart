import 'package:contacts_app/contacts_home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ContactsApp());
}

class ContactsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts App',
      home: ContactsHomePage(),
    );
  }
}
