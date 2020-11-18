import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yen/src/widget_custom/card/avater_profile.dart';
import 'package:yen/src/widget_custom/textfield/search_textfield.dart';
import 'package:yen/statics/model_satatic.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // FirebaseFirestore _database = FirebaseFirestore.instance;

  @override
  void initState() {
    _getPostUID();
    super.initState();
  }

  Future<String> getDataId(DocumentReference docRef) async {
    DocumentSnapshot docSnap = await docRef.get();
    var docId2 = docSnap.reference.id;
    return docId2;
  }

  void _getPostUID() async {
    FirebaseFirestore _database = FirebaseFirestore.instance;

    await _database.collection("Chat").get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((value) {
        log("${value.id}");
      });
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
            child: Column(
              children: [
                _headerContainer(context),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 80,
                        child: Card(
                          elevation: 5,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              AvaterProfile(
                                pathAvater: ModelStatic.user.avatarUrl,
                                size: 60,
                                maginRight: 10,
                              ),
                              Text(
                                ModelStatic.user.displayname,
                                style: TextStyle(
                                    color: Colors.grey[800], fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _headerContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff0068B4),
            Color(0xff00B3ED),
          ],
          stops: [0.1, 1],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
        child: Column(
          children: [
            Row(
              children: [
                AvaterProfile(
                  pathAvater: ModelStatic.user.avatarUrl,
                  size: 70,
                  maginRight: 10,
                ),
                Text(
                  "Chat",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            SearchTextField(),
          ],
        ),
      ),
    );
  }
}
