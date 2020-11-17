import 'dart:developer';
import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yen/models/post_model.dart';
import 'package:yen/models/user_model.dart';
import 'package:yen/src/page/post/post_page.dart';
import 'package:yen/src/widget_custom/item_list/post_list_item.dart';
import 'package:yen/src/widget_custom/line/line.dart';
import 'package:yen/src/widget_custom/textfield/search_textfield.dart';
import 'package:yen/statics/list_satatic.dart';
import 'package:yen/statics/model_satatic.dart';
import 'package:yen/statics/string_static.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseFirestore _database = FirebaseFirestore.instance;
  int _position = 1;
  List<String> menuList = ["commented on your post", "likes a your post"];
  // List<String> _idPost = List<String>();

  @override
  void initState() {
    _getData();
    _getPostID();
    // _getPost();
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void _getPostID() async {
    ListStatic.postList.clear();
    for (var i = 0; i < ListStatic.uidList.length; i++) {
      await _database
          .collection("Posts")
          .doc(ListStatic.uidList[i])
          .collection("detail")
          .get()
          .then((QuerySnapshot snapshot) {
        snapshot.docs.forEach((value) {
          _getPost("${ListStatic.uidList[i]}_${value.id.toString()}");
        });
      });
    }
  }

  void _getPost(String id) async {
    var text = id.split("_");
    await _database
        .collection("Posts")
        .doc(text[0])
        .collection("detail")
        .doc(text[1])
        .get()
        .then((value) {
      PostModel post = PostModel.fromJson(value.data());

      post.id = DateTime.fromMillisecondsSinceEpoch(int.parse(post.id) * 1000)
          .toString();
      ListStatic.postList.add(post);
      ListStatic.postList.sort((a, b) => b.id.compareTo(a.id));
      if (this.mounted) {
        setState(() {});
      }
    });
  }

  void _getData() async {
    await _database
        .collection("Users")
        .doc(StringStatic.uid)
        .get()
        .then((value) {
      ModelStatic.user = UserModel.fromJson(value.data());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE2F2F6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _headerHomePage(),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _textToggle(
                    callback: () {
                      setState(() {
                        _position = 1;
                      });
                    },
                    text: 'NEWS',
                  ),
                  _textToggle(
                    callback: () {
                      // setState(() {
                      //   _position = 2;
                      // });
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PostPage(),
                        ),
                      );
                    },
                    text: 'POST',
                  ),
                ],
              ),
              _lineToggle(context),
              _position == 1
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        double _width =
                            MediaQuery.of(context).size.width * 0.65;
                        return PostListItem(
                          username: ListStatic.postList[index].displayname,
                          date: ListStatic.postList[index].timePost,
                          pathAvater: ListStatic.postList[index].avatarUrl,
                          width: _width,
                          text:
                              "${ListStatic.postList[index].topic}\n${ListStatic.postList[index].content}",
                          totalComments:
                              ListStatic.postList[index].comment == null
                                  ? ""
                                  : ListStatic.postList[index].comment.length
                                      .toString(),
                          totalLike:
                              ListStatic.postList[index].totalLike.toString(),
                          pathImage: ListStatic.postList[index].imageUrl == ""
                              ? null
                              : ListStatic.postList[index].imageUrl,
                        );
                      },
                      itemCount: ListStatic.postList.length,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  void _selecteMenu(String menu, BuildContext context) {
    // _logout();
  }

  Stack _lineToggle(BuildContext context) {
    return Stack(
      children: [
        Align(
          child: Line(
            width: MediaQuery.of(context).size.width - 80,
          ),
        ),
        _position == 1
            ? Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 45),
                  child: Line(
                    width: (MediaQuery.of(context).size.width - 80) / 2.2,
                    height: 4,
                    lineColor: Color(0xff007EC4),
                  ),
                ),
              )
            : Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.only(right: 45),
                  child: Line(
                    width: (MediaQuery.of(context).size.width - 80) / 2.2,
                    height: 4,
                    lineColor: Color(0xff007EC4),
                  ),
                ),
              )
      ],
    );
  }

  Widget _textToggle({String text, Function callback}) {
    return InkWell(
      onTap: callback,
      child: Container(
        width: (MediaQuery.of(context).size.width - 80) / 2,
        child: Column(
          children: [
            Text(
              '$text',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  Container _headerHomePage() {
    return Container(
      height: 200,
      child: Stack(
        children: [
          Container(
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SearchTextField(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 50,
                    height: 70,
                    alignment: Alignment.topCenter,
                    child: Badge(
                      badgeColor: Color(0xffF5EA14),
                      alignment: Alignment.center,
                      position: BadgePosition(end: 0, top: 15),
                      child: PopupMenuButton<String>(
                          icon: Icon(
                            Icons.notifications_none,
                            size: 50,
                            color: Colors.white,
                          ),
                          color: Color(0xffffffff),
                          onSelected: (value) {
                            _selecteMenu(value, context);
                          },
                          itemBuilder: (BuildContext context) {
                            return menuList.map((String menu) {
                              return PopupMenuItem<String>(
                                value: menu,
                                child: Text(
                                  menu,
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList();
                          }),
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.only(left: 40),
              padding: EdgeInsets.all(2),
              decoration: new BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: new BorderRadius.all(Radius.circular(50)),
              ),
              child: Container(
                width: 80,
                height: 80,
                decoration: new BoxDecoration(
                  color: Color(0xffCBCBCA),
                  borderRadius: new BorderRadius.all(Radius.circular(50)),
                  image: DecorationImage(
                    image: NetworkImage(ModelStatic.user.avatarUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
