import 'package:flutter/material.dart';
import 'package:yen/page/member/member_list_page.dart';
import 'package:yen/widget_custom/card/avater_profile.dart';
import 'package:yen/widget_custom/icon/icon_and_text.dart';

class MemberPage extends StatefulWidget {
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  final arrCountry = [
    "assets/images/thai.png",
    "assets/images/cambodia.png",
    "assets/images/myanmar.png",
    "assets/images/malaysia.png",
    "assets/images/laos.png",
    "assets/images/vietnam.png",
    "assets/images/indonesia.png",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _headerContainer(context),
              SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 7,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MemberListPage()));
                    },
                    child: Container(
                      child: Image.asset(arrCountry[index]),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card _headerContainer(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      elevation: 5,
      child: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.35,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AvaterProfile(
                    pathAvater:
                        "https://upload.wikimedia.org/wikipedia/en/thumb/b/b0/Avatar-Teaser-Poster.jpg/220px-Avatar-Teaser-Poster.jpg",
                    size: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        alignment: Alignment.centerRight,
                        child: Text(
                          'ANNA',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  IconAndText(
                      icon: Icons.phone, title: "+ 00 - 0000 - 0000 - 000"),
                  IconAndText(icon: Icons.mail, title: "INFO@COMPANYNANE.COM"),
                  IconAndText(
                      icon: Icons.language, title: "WWW.COMPANYNANE.COM"),
                  SizedBox(height: 5),
                  Text(
                    '1234 YOUR LOCATION HERE',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  Text(
                    'YOUR RD. YOUR STREET POSTAL 00000',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 40),
              child: Text(
                'Country',
                style: TextStyle(
                  color: Color(0xff007EC4),
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
