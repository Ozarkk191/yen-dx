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
    double _cWidth = MediaQuery.of(context).size.width * 0.6;
    double _cWidth2 = MediaQuery.of(context).size.width * 0.7;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(bottom: 50),
                  child: Column(
                    children: [
                      Card(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AvaterProfile(
                                pathAvater: widget.post.avatarUrl,
                                size: 60,
                              ),
                              SizedBox(width: 5),
                              Container(
                                width: _cWidth2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text(
                                          widget.post.displayname,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          widget.post.timePost,
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Container(
                                      width: _cWidth2,
                                      child: Text(
                                        widget.post.content,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      widget.post.comment.length != 0
                          ? _noComment()
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 20,
                              itemBuilder: (BuildContext context, int index) {
                                return _commentItem(
                                  context: context,
                                  cWidth: _cWidth,
                                );
                              },
                            ),
                    ],
                  ),
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

  Widget _noComment() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.chat_bubble_outline,
          color: Colors.grey,
          size: 100,
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
    );
  }

  Container _commentItem({BuildContext context, double cWidth}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AvaterProfile(
                  pathAvater: ModelStatic.user.avatarUrl,
                  size: 40,
                ),
                SizedBox(width: 5),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ModelStatic.user.displayname,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: cWidth,
                            child: Text(
                              "ModelStatic.user.displayname1234648ejidsfhkudsfwhoeksdflnsdjfnmsgbwoflkm,dshfwoeijwnfksjfieo",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.thumb_up_outlined,
                            color: Colors.grey,
                            size: 20,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'ถูกใจ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
