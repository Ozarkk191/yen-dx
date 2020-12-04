import 'package:flutter/material.dart';
import 'package:yen/models/post_model.dart';

class CommentPage extends StatefulWidget {
  final PostModel post;

  const CommentPage({Key key, @required this.post}) : super(key: key);
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
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
                height: MediaQuery.of(context).size.height,
                child: widget.post.comment.length == 0
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
                    : Container(),
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
                      width: MediaQuery.of(context).size.width - 20,
                      height: 50,
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
