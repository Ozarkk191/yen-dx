import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yen/models/user_model.dart';
import 'package:yen/src/page/chat/chat_room/chat_room_page.dart';
import 'package:yen/src/widget_custom/card/avater_profile.dart';
import 'package:yen/src/widget_custom/textfield/search_textfield.dart';
import 'package:yen/statics/model_satatic.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  FirebaseFirestore _database = FirebaseFirestore.instance;
  List<UserModel> _chatList = List<UserModel>();

  @override
  void initState() {
    _getPostUID();
    super.initState();
  }

  Future<List<UserModel>> getDataId() async {
    UserModel user;
    _chatList.clear();
    for (var i = 0; i < ModelStatic.user.chatList.length; i++) {
      await _database
          .collection("Users")
          .doc(ModelStatic.user.chatList[i])
          .get()
          .then((value) {
        user = UserModel.fromJson(value.data());
      }).then((value) {
        _chatList.add(user);
      });
    }

    return _chatList;
  }

  void _getPostUID() async {
    // FirebaseFirestore _database = FirebaseFirestore.instance;

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
                FutureBuilder(
                  future: getDataId(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: _chatList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 80,
                              child: InkWell(
                                onTap: () {
                                  List<String> list = [
                                    ModelStatic.user.uid,
                                    _chatList[index].uid,
                                  ];
                                  list.sort((a, b) => a.compareTo(b));
                                  String key = "${list[0]}_${list[1]}";
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (contaxt) => ChatRoomPage(
                                        keyRoom: key,
                                        user: _chatList[index],
                                      ),
                                    ),
                                  );
                                },
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
                                        pathAvater: _chatList[index].avatarUrl,
                                        size: 60,
                                        maginRight: 10,
                                      ),
                                      Text(
                                        _chatList[index].displayname,
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return Expanded(
                        child: Center(
                          child: Container(),
                        ),
                      );
                    }
                  },
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
