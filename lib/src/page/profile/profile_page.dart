import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';
import 'package:yen/models/user_model.dart';
import 'package:yen/src/page/navigation/navigation_page.dart';
import 'package:yen/src/page/register/register_page.dart';
import 'package:yen/src/widget_custom/button/back_button.dart';
import 'package:yen/src/widget_custom/button/non_corner_button.dart';
import 'package:yen/src/widget_custom/line/line.dart';
import 'package:yen/src/widget_custom/textfield/main_textfield.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  const ProfilePage({Key key, this.user}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _country = TextEditingController();
  TextEditingController _yen = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _business = TextEditingController();
  FirebaseFirestore _database = FirebaseFirestore.instance;
  File _image;
  final picker = ImagePicker();

  @override
  void initState() {
    _email.text = widget.user.email;
    super.initState();
  }

  @override
  void dispose() {
    _firstname.dispose();
    _lastname.dispose();
    _country.dispose();
    _yen.dispose();
    _phone.dispose();
    _email.dispose();
    _business.dispose();
    super.dispose();
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void _checkField() {
    if (_firstname.text == "" ||
        _lastname.text == "" ||
        _country.text == "" ||
        _yen.text == "" ||
        _phone.text == "" ||
        _email.text == "" ||
        _business.text == "") {
      Toast.show("ห้ามมีฟิวล์ว่าง", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    } else {
      update();
    }
  }

  void update() async {
    // var now = DateTime.now().millisecondsSinceEpoch.toString();
    // final StorageReference storageRef =
    //     FirebaseStorage.instance.ref().child(now);
    // StorageUploadTask uploadTask = storageRef.putFile(
    //   File(_image.path),
    //   StorageMetadata(
    //     contentType: 'image/jpg',
    //   ),
    // );
    // StorageTaskSnapshot download = await uploadTask.onComplete;
    // String avatarUrl = await download.ref.getDownloadURL();
    // log(avatarUrl);

    UserModel user = UserModel(
      avatarUrl: "avatarUrl",
      firstname: _firstname.text,
      lastname: _lastname.text,
      country: _country.text,
      phone: _phone.text,
      yenDSections: _yen.text,
      email: _email.text,
      business: _business.text,
      displayname: "${_firstname.text} ${_lastname.text}",
      uid: widget.user.uid,
    );
    await _database
        .collection("Users")
        .doc(widget.user.uid)
        .set(user.toJson())
        .then((value) {
      Toast.show("บันทึกสำเร็จ", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => NavigationPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg_profile.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BackButtonArrow(
                  callback: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 0),
                  width: MediaQuery.of(context).size.width - 60,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 70),
                        child: Image.asset(
                          "assets/images/frame2.png",
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: getImage,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                                child: _image == null
                                    ? Image.asset(
                                        "assets/images/avater_profile.png",
                                        width: 120,
                                        height: 120,
                                      )
                                    : Image.file(
                                        _image,
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "My Profile",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff3A79B1)),
                            ),
                            SizedBox(height: 2),
                            Line(width: 110),
                            SizedBox(height: 10),
                            MainTextField(
                              labelText: 'First name',
                              controller: _firstname,
                            ),
                            SizedBox(height: 10),
                            MainTextField(
                              labelText: 'Last name',
                              controller: _lastname,
                            ),
                            SizedBox(height: 10),
                            MainTextField(
                              labelText: 'Country',
                              controller: _country,
                            ),
                            SizedBox(height: 10),
                            MainTextField(
                              labelText: 'YEN-D Sections',
                              controller: _yen,
                            ),
                            SizedBox(height: 10),
                            MainTextField(
                              labelText: 'Contact Tel',
                              controller: _phone,
                            ),
                            SizedBox(height: 10),
                            MainTextField(
                              labelText: 'E-mail',
                              controller: _email,
                              enabled: false,
                            ),
                            SizedBox(height: 10),
                            MainTextField(
                              labelText: 'Business',
                              controller: _business,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                NonCornerButton(
                  textButton: "Submit",
                  textColor: Color(0xffffffff),
                  borderRadius: 40,
                  padding: 0,
                  color: Color(0xff80D3F6),
                  width: MediaQuery.of(context).size.width / 2.7,
                  textSize: 20,
                  onTap: () {
                    _checkField();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
