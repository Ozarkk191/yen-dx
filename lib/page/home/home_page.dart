import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:yen/widget_custom/item_list/post_list_item.dart';
import 'package:yen/widget_custom/line/line.dart';
import 'package:yen/widget_custom/textfield/search_textfield.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _position = 1;
  List<String> menuList = ["commented on your post", "likes a your post"];

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
                      text: 'NEWS'),
                  _textToggle(
                      callback: () {
                        setState(() {
                          _position = 2;
                        });
                      },
                      text: 'POST'),
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
                          username: 'Username',
                          date: 'March 23 2020',
                          pathAvater:
                              'https://i.ytimg.com/vi/AxLH0lXEGAY/hqdefault.jpg',
                          width: _width,
                          text:
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                          totalComments: '123',
                          totalLike: '122',
                          pathImage:
                              'https://storage.googleapis.com/techsauce-prod/ugc/uploads/2019/11/1200_800_AC7CC6E9-9753-4D21-A84B-E426B608C4C9.jpeg',
                        );
                      },
                      itemCount: 10,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  void _selecteMenu(String menu, BuildContext context) {
    //to do
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
                    image: AssetImage("assets/images/avatar_profile2.png"),
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
