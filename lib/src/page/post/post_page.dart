import 'package:flutter/material.dart';
import 'package:yen/src/widget_custom/button/non_corner_button.dart';
import 'package:yen/src/widget_custom/card/avater_profile.dart';
import 'package:yen/src/widget_custom/line/line.dart';
import 'package:yen/src/widget_custom/textfield/post_textfield.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE2F2F6),
      body: SafeArea(
        child: Column(
          children: [
            _headerPost(),
            SizedBox(height: 50),
            PostTextField(
              hint: 'Topic..',
              maxLength: 120,
            ),
            SizedBox(height: 5),
            PostTextField(
              hint: 'content..',
              maxLength: 10000,
              maxLines: 10,
            ),
            SizedBox(height: 5),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              decoration: new BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: new BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.image,
                          size: 30,
                          color: Color(0xff009EF8),
                        ),
                        Icon(
                          Icons.sentiment_satisfied,
                          size: 30,
                          color: Color(0xff009EF8),
                        ),
                      ],
                    ),
                  ),
                  NonCornerButton(
                    textButton: 'POST',
                    onTap: () {},
                    borderRadius: 5,
                    padding: 0,
                    color: Color(0xff009EF8),
                    width: 70,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _headerPost() {
    return Container(
      margin: EdgeInsets.fromLTRB(40, 20, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AvaterProfile(
            pathAvater:
                'https://upload.wikimedia.org/wikipedia/en/thumb/b/b0/Avatar-Teaser-Poster.jpg/220px-Avatar-Teaser-Poster.jpg',
            size: 80,
          ),
          Column(
            children: [
              Text(
                'POST',
                style: TextStyle(
                    color: Color(0xff009EF8),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Line(
                width: 120,
              )
            ],
          ),
          Expanded(
            child: Container(
              child: Icon(
                Icons.close,
                size: 30,
                color: Color(0xff009EF8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
