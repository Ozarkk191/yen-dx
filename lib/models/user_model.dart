import 'package:flutter/cupertino.dart';

class UserModel {
  String avatarUrl;
  String firstname;
  String lastname;
  String country;
  String yenDSections;
  String phone;
  String email;
  String business;
  String displayname;
  String uid;
  String notitoken;

  UserModel({
    @required this.avatarUrl,
    @required this.firstname,
    @required this.lastname,
    @required this.country,
    @required this.phone,
    @required this.yenDSections,
    @required this.email,
    @required this.business,
    @required this.displayname,
    @required this.uid,
    @required this.notitoken,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : avatarUrl = json['avatarUrl'],
        firstname = json['firstname'],
        lastname = json['lastname'],
        country = json['country'],
        yenDSections = json['yenDSections'],
        phone = json['phone'],
        email = json['email'],
        business = json['business'],
        displayname = json['displayname'],
        uid = json['uid'],
        notitoken = json['notitoken'];

  toJson() {
    return {
      "avatarUrl": avatarUrl,
      "firstname": firstname,
      "lastname": lastname,
      "country": country,
      "yenDSections": yenDSections,
      "phone": phone,
      "email": email,
      "business": business,
      "displayname": displayname,
      "uid": uid,
      "notitoken": notitoken,
    };
  }
}
