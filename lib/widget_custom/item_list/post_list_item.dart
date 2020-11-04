import 'package:flutter/material.dart';
import 'package:yen/widget_custom/card/avater_profile.dart';

class PostListItem extends StatelessWidget {
  final double width;
  final String username;
  final String date;
  final String text;
  final String pathImage;
  final String pathAvater;
  final String totalLike;
  final String totalComments;

  const PostListItem(
      {Key key,
      @required this.width,
      @required this.username,
      @required this.date,
      this.text,
      this.pathImage,
      @required this.pathAvater,
      this.totalLike,
      this.totalComments})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> menuList = ["Edit Post", "Delete"];
    return Container(
      margin: EdgeInsets.only(bottom: 0, left: 20, right: 20, top: 5),
      width: MediaQuery.of(context).size.width / 1.5,
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all(Radius.circular(5)),
      ),
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AvaterProfile(
              pathAvater: pathAvater,
              maginBottom: 0,
              maginLeft: 10,
              maginTop: 10,
              maginRight: 5,
              size: 45,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 10, 10, 10),
              child: Column(
                children: [
                  Container(
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '$username',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '$date',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.topRight,
                            child: PopupMenuButton<String>(
                                icon: Icon(
                                  Icons.more_horiz,
                                  color: Color(0xff007EC4),
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
                            // child: Icon(
                            //   Icons.more_horiz,
                            //   color: Color(0xff007EC4),
                            // ),
                            // ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: width,
                    child: Text('$text'),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Image.network(
                      "$pathImage",
                      fit: BoxFit.cover,
                      width: pathImage != null ? width : 0,
                    ),
                  ),
                  Container(
                    height: 40,
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.chat,
                              size: 15,
                              color: Colors.grey,
                            ),
                            Text(
                              totalComments != null ? "$totalComments" : 0,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.thumb_up,
                              size: 15,
                              color: Colors.grey,
                            ),
                            Text(
                              totalLike != null ? "$totalLike" : 0,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selecteMenu(String menu, BuildContext context) {
    //to do
  }
}
