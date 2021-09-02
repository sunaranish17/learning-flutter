import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:learning_flutter/hive_implemntation/models/contact.dart';
import 'package:learning_flutter/hive_implemntation/widgets/new_contact_form.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Hive"),
      ),
      body: Column(
        children: [
          Expanded(child: _buildListView()),
          NewContactForm(),
        ],
      ),
    );
  }

  Widget _buildListView() {
    // ignore: deprecated_member_use
    return WatchBoxBuilder(
      box: Hive.box('contacts'),
      builder: (context, contactsBox) {
        return ListView.builder(
          itemCount: contactsBox.length,
          itemBuilder: (context, index) {
            final contact = contactsBox.getAt(index) as Contact;

            return ListTile(
              title: Text(contact.name),
              subtitle: Text(contact.age.toString()),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      contactsBox.putAt(
                        index,
                        Contact('${contact.name}*', contact.age + 1),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      contactsBox.deleteAt(index);
                    },
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
