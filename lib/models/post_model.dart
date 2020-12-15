import 'package:flutter/material.dart';

class PostModel {
  String avatarUrl;
  String displayname;
  String topic;
  String content;
  String timePost;
  List<dynamic> comment;
  int totalLike;
  String imageUrl;
  String id;
  String uid;

  PostModel({
    @required this.avatarUrl,
    @required this.displayname,
    this.topic,
    this.content,
    @required this.timePost,
    @required this.comment,
    @required this.totalLike,
    this.imageUrl,
    this.id,
    this.uid,
  });

  PostModel.fromJson(Map<String, dynamic> json)
      : avatarUrl = json['avatarUrl'],
        displayname = json['displayname'],
        topic = json['topic'],
        content = json['content'],
        timePost = json['timePost'],
        comment = json['comment'],
        totalLike = json['totalLike'],
        imageUrl = json['imageUrl'],
        id = json['id'],
        uid = json['uid'];

  toJson() {
    return {
      "avatarUrl": avatarUrl,
      "displayname": displayname,
      "topic": topic,
      "content": content,
      "timePost": timePost,
      "comment": comment,
      "totalLike": totalLike,
      "imageUrl": imageUrl,
      "id": id,
      "uid": uid,
    };
  }
}
