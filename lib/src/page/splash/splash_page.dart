import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yen/src/page/login/login_page.dart';
import 'package:yen/src/page/navigation/navigation_page.dart';
import 'package:yen/src/page/profile/profile_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  List<String> _uidList = List<String>();
  void _timer() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  void _checkUser() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    User user = _auth.currentUser;
    FirebaseFirestore _databaseReference = FirebaseFirestore.instance;
    if (user != null) {
      await _databaseReference
          .collection("Users")
          .get()
          .then((QuerySnapshot snapshot) {
        snapshot.docs.forEach((value) {
          _uidList.add(value.id);
        });
      }).then((value) {
        var uid = _uidList.where((element) => element == user.uid).toList();
        if (uid.length != 0) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => NavigationPage()));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => ProfilePage(user: user)));
        }
      });
    } else {
      _timer();
    }
  }

  @override
  void initState() {
    _checkUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.asset(
          "assets/images/bg.png",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
