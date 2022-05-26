import 'package:flutter/material.dart';
import 'package:json_eg/src/features/contact/model/contact_model.dart';
import 'package:json_eg/src/features/contact/pages/contact_detail_page.dart';
import 'package:json_eg/src/features/contact/services/contact_services.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<ContactModel> contacts = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact App"),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (_, pos) {
            ContactModel contactModel = contacts[pos];
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purpleAccent,
                backgroundImage: NetworkImage(contactModel.photo),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) =>
                        ContactDetailPage(contactModel: contactModel)));
              },
              title: Text(contactModel.name),
              subtitle: Text(contactModel.address),
            );
          },
        ),
      ),
    );
  }

  Future<void> getData() async {
    ContactServices contactServices = ContactServices();
    contactServices.getData().then((value) {
      setState(() {
        contacts = value;
      });
    });
  }
}
