import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:learning_flutter/hive_implemntation/models/contact.dart';

class NewContactForm extends StatefulWidget {
  const NewContactForm({Key? key}) : super(key: key);

  @override
  _NewContactFormState createState() => _NewContactFormState();
}

class _NewContactFormState extends State<NewContactForm> {
  final _formKey = GlobalKey<FormState>();

  String? _name;
  String? _age;

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  void addContact(Contact contact) {
    final contactsBox = Hive.box('contacts');
    contactsBox.add(contact);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  onSaved: (value) {
                    _name = value;
                    _nameController.clear();
                  },
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                    controller: _ageController,
                    decoration: InputDecoration(labelText: 'Age'),
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      _age = value;
                      _ageController.clear();
                    }),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 15.0,
            ),
            child: ElevatedButton(
              child: Text('Add New Contact'),
              onPressed: () {
                _formKey.currentState?.save();
                final newContact = Contact(_name!, int.parse(_age!));
                addContact(newContact);
              },
            ),
          ),
        ],
      ),
    );
  }
}
