import 'package:contacts_app/contactList.dart';
import 'package:flutter/material.dart';

import 'add_contact_button.dart';
import 'contact_Input_fields.dart';
import 'editContactDialog.dart';

class ContactsHomePage extends StatefulWidget {
  @override
  _ContactsHomePageState createState() => _ContactsHomePageState();
}

class _ContactsHomePageState extends State<ContactsHomePage> {
  List<Contact> contacts = [];
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  void _addNewContact() {
    final name = _nameController.text;
    final phone = _phoneController.text;

    if (name.isNotEmpty && phone.isNotEmpty) {
      setState(() {
        contacts.add(Contact(name: name, phoneNumber: phone));
      });

      _nameController.clear();
      _phoneController.clear();
    }
  }

  void _deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  void _editContact(int index) {
    _nameController.text = contacts[index].name;
    _phoneController.text = contacts[index].phoneNumber;

    showDialog(
      context: context,
      builder: (context) => EditContactDialog(
        nameController: _nameController,
        phoneController: _phoneController,
        onSave: () {
          setState(() {
            contacts[index].name = _nameController.text;
            contacts[index].phoneNumber = _phoneController.text;
          });
          _nameController.clear();
          _phoneController.clear();
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,
        title: Text('Contacts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ContactInputFields(
              nameController: _nameController,
              phoneController: _phoneController,
            ),
            SizedBox(height: 20),
            AddContactButton(onPressed: _addNewContact),
            SizedBox(height: 20),
            Expanded(
              child: contacts.isEmpty
                  ? Center(child: Text('No contacts yet!'))
                  : ContactList(
                contacts: contacts,
                onDelete: _deleteContact,
                onEdit: _editContact,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class Contact {
  String name;
  String phoneNumber;

  Contact({required this.name, required this.phoneNumber});
}

