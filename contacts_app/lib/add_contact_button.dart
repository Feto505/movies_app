import 'package:flutter/material.dart';

class AddContactButton extends StatelessWidget {
  final VoidCallback onPressed;

  AddContactButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      onPressed: onPressed,
      child: Text('Add Contact'),
    );
  }
}
