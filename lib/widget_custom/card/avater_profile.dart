import 'package:flutter/material.dart';

class AvaterProfile extends StatelessWidget {
  final String pathAvater;
  final double size;
  final double maginTop;
  final double maginLeft;
  final double maginRight;
  final double maginBottom;

  const AvaterProfile({
    Key key,
    @required this.pathAvater,
    this.size = 50,
    this.maginTop = 0,
    this.maginLeft = 0,
    this.maginRight = 0,
    this.maginBottom = 0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: EdgeInsets.fromLTRB(maginLeft, maginTop, maginRight, maginBottom),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all(Radius.circular(50)),
      ),
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Image.network("$pathAvater"),
      ),
    );
  }
}
