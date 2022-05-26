

import 'package:flutter/material.dart';
import 'package:json_eg/src/features/contact/model/contact_model.dart';

class ContactDetailPage extends StatelessWidget {

  final ContactModel contactModel;
  const ContactDetailPage({required this.contactModel,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contactModel.name),
      ),
      body: Column(
        children: [
          Image.network(contactModel.photo),
          Text(contactModel.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
          Text(contactModel.address,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
        ],
      )
    );
  }
}
