class ContactModel {
  String name;
  String address;
  String contact;
  String website;
  String photo;

  ContactModel(
      {required this.name,
      required this.address,
      required this.contact,
      required this.website,
      required this.photo});  // Default Constructor  -- 4 rules  - function,classname, no return,


  // {
  // "name":"John Wesley",
  // "address":"Epworth, Lincolnshire, United Kingdom",
  // "contact" : "12345678",
  // "photo": "https://i1.wp.com/www.pnwumc.org/news/wp-content/uploads/2015/04/john-wesley.jpg?fit=700%2C365&ssl=1",
  // "url": "http://www.john-wesley.com"
  // },


  // Factory Named Constructors   -- function, classname.somename, we can return values

  factory ContactModel.fromJSON(Map<String,dynamic> json){
    ContactModel contactModel = ContactModel(name: json["name"], address: json["address"], contact: json["contact"],
        website: json["url"], photo: json["photo"]);
    return contactModel;
  }

}


// 1. we need to read the JSON file