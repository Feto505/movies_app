import 'package:flutter/material.dart';

import 'contacts_home_screen.dart';

class ContactList extends StatelessWidget {
  final List<Contact> contacts;
  final Function(int) onDelete;
  final Function(int) onEdit;

  ContactList({
    required this.contacts,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final contact = contacts[index];
        return ListTile(
          title: Text(contact.name),
          subtitle: Text(contact.phoneNumber),
          trailing: IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () => onDelete(index),
          ),
          onTap: () => onEdit(index),
        );
      },
    );
  }
}
