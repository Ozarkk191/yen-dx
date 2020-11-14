import 'package:flutter/material.dart';
import 'package:yen/src/widget_custom/button/back_button.dart';
import 'package:yen/src/widget_custom/card/avater_profile.dart';
import 'package:yen/src/widget_custom/icon/icon_and_text.dart';

class MemberDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.20,
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(80)),
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
                child: BackButtonArrow(callback: () {
                  Navigator.pop(context);
                }),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.fromLTRB(
                    0, MediaQuery.of(context).size.height * 0.10, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
                      child: AvaterProfile(
                        pathAvater:
                            'https://upload.wikimedia.org/wikipedia/en/thumb/b/b0/Avatar-Teaser-Poster.jpg/220px-Avatar-Teaser-Poster.jpg',
                        size: 120,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
                      child: Text(
                        'Noah',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
                      child: Text(
                        'Loren',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xffE2F2F6),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 80,
                            child: Text(
                              'position',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 80,
                            child: IconAndText(
                              mainAxisAlignment: MainAxisAlignment.start,
                              icon: Icons.phone,
                              title: '+ 00 - 0000 - 0000 - 000',
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 80,
                            child: IconAndText(
                              mainAxisAlignment: MainAxisAlignment.start,
                              icon: Icons.mail,
                              title: 'INFO@COMPANYNANE.COM',
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 80,
                            child: IconAndText(
                              mainAxisAlignment: MainAxisAlignment.start,
                              icon: Icons.language,
                              title: 'WWW.COMPANYNANE.COM',
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 80,
                            alignment: Alignment.centerRight,
                            child: Text(
                              '1234 YOUR LOCATION HERE',
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 80,
                            alignment: Alignment.centerRight,
                            child: Text(
                              'YOUR RD. YOUR STREET POSTAL 00000',
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Icon(
                        Icons.chat,
                        color: Color(0xff007EC4),
                        size: 50,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 100,
                          height: 40,
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xff007EC4),
                          ),
                          child: Container(
                            width: 100,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color(0xffffffff),
                            ),
                            child: Text(
                              'Chat',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xff007EC4)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
