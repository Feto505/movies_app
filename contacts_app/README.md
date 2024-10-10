class Contact {
String name;
String phoneNumber;

Contact({required this.name, required this.phoneNumber});
}
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

class ContactsHomePage extends StatefulWidget {
@override
_ContactsHomePageState createState() => _ContactsHomePageState();
}

class _ContactsHomePageState extends State<ContactsHomePage> {
List<Contact> contacts = [];

// Function to add a new contact
void _addNewContact(String name, String phoneNumber) {
setState(() {
contacts.add(Contact(name: name, phoneNumber: phoneNumber));
});
}

// Form to enter contact details
void _showAddContactDialog() {
final _nameController = TextEditingController();
final _phoneController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Contact'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                final name = _nameController.text;
                final phone = _phoneController.text;
                if (name.isNotEmpty && phone.isNotEmpty) {
                  _addNewContact(name, phone);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );

}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Contacts'),
),
body: contacts.isEmpty
? Center(child: Text('No contacts yet!'))
: ListView.builder(
itemCount: contacts.length,
itemBuilder: (context, index) {
final contact = contacts[index];
return ListTile(
title: Text(contact.name),
subtitle: Text(contact.phoneNumber),
);
},
),
floatingActionButton: FloatingActionButton(
onPressed: _showAddContactDialog,
child: Icon(Icons.add),
),
);
}
}

class Contact {
String name;
String phoneNumber;

Contact({required this.name, required this.phoneNumber});
}
