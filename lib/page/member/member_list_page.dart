import 'package:flutter/material.dart';
import 'package:yen/widget_custom/button/back_button2.dart';
import 'package:yen/widget_custom/card/avater_profile.dart';
import 'package:yen/widget_custom/icon/icon_and_text.dart';
import 'package:yen/widget_custom/item_list/member_list_item.dart';
import 'package:yen/widget_custom/textfield/search_textfield.dart';

import 'member_detail_page.dart';

class MemberListPage extends StatefulWidget {
  @override
  _MemberListPageState createState() => _MemberListPageState();
}

class _MemberListPageState extends State<MemberListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE1F2F5),
        body: Column(
          children: [
            _header(context),
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return MemberListItem(
                    address1: '1234 YOUR LOCATION HERE',
                    address2: 'YOUR RD. YOUR STREET POSTAL 00000',
                    email: "INFO@COMPANYNANE.COM",
                    imageUrl:
                        'https://upload.wikimedia.org/wikipedia/en/thumb/b/b0/Avatar-Teaser-Poster.jpg/220px-Avatar-Teaser-Poster.jpg',
                    name: 'Aaren',
                    phone: "+ 00 - 0000 - 0000 - 000",
                    position: 'position',
                    website: "WWW.COMPANYNANE.COM",
                    callback: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MemberDetailPage()));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _header(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        color: Color(0xffE1F2F5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            alignment: Alignment.center,
            child: Row(
              children: [
                BackButtonArrow2(
                  callback: () {
                    Navigator.pop(context);
                  },
                ),
                SearchTextField(),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              'Member',
              style: TextStyle(
                color: Color(0xff007EC4),
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
