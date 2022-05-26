import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/contact_model.dart';


/// We need to read the json file and decode it , then convert it to a model

class ContactServices{

  Future<String> loadRecordsJsonFile() async {
    String data = await rootBundle.loadString("assets/data/records.json");
    return data;
  }


  // 1. Read the JSON File  --> String
  // 2. Decode the JSON  --> List<Map<String,dynamic>>
  // 3. Convert List<dynamic> to List<ContactModel>


  // {
  // "name":"John Wesley",
  // "address":"Epworth, Lincolnshire, United Kingdom",
  // "contact" : "12345678",
  // "photo": "https://i1.wp.com/www.pnwumc.org/news/wp-content/uploads/2015/04/john-wesley.jpg?fit=700%2C365&ssl=1",
  // "url": "http://www.john-wesley.com"
  // },  -- Map<String,dynamic>

  // We need some function which converts the Map into instance of Contact Model

  Future<List<ContactModel>> getData() async {
    String rawJSON = await loadRecordsJsonFile();
    List<dynamic> decodedData = jsonDecode(rawJSON);
    List<ContactModel> contactModelList = decodedData.map((element) => ContactModel.fromJSON(element)).toList();
    return contactModelList;
  }


}