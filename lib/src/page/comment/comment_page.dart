import 'package:flutter/material.dart';
import 'package:yen/models/post_model.dart';
import 'package:yen/src/widget_custom/card/avater_profile.dart';
import 'package:yen/statics/model_satatic.dart';

class CommentPage extends StatefulWidget {
  final PostModel post;

  const CommentPage({Key key, @required this.post}) : super(key: key);
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.7;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 80,
                child: widget.post.comment.length != 0
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.chat_bubble_outline,
                            color: Colors.grey,
                            size: 150,
                          ),
                          Text(
                            'ยังไม่มีความคิดเห็น',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'เป็นคนแรกที่แสดงความคิดเห็น',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    : ListView.builder(
                        itemCount: 20,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                  child: Row(
                                    children: [
                                      AvaterProfile(
                                        pathAvater: ModelStatic.user.avatarUrl,
                                        size: 60,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 20),
                                          Text(
                                            ModelStatic.user.displayname,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            width: c_width,
                                            child: Text(
                                              "ModelStatic.user.displayname1234648ejidsfhkudsfwhoeksdflnsdjfnmsgbwoflkm,dshfwoeijwnfksjfieo",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.grey,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'เขียนความคิดเห็น',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.camera_alt_outlined),
                          SizedBox(width: 10),
                          Icon(Icons.send),
                        ],
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
