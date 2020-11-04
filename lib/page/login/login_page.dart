import 'package:flutter/material.dart';
import 'package:yen/page/register/register_page.dart';
import 'package:yen/widget_custom/button/non_corner_button.dart';
import 'package:yen/widget_custom/line/line.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              "assets/images/bg_main.png",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 2.2),
                  child: Image.asset(
                    "assets/images/logo_yen.png",
                    width: MediaQuery.of(context).size.width / 1.5,
                  ),
                ),
                Image.asset(
                  "assets/images/text.png",
                  width: MediaQuery.of(context).size.width / 1.5,
                ),
                SizedBox(height: 50),
                NonCornerButton(
                  textButton: "Join now",
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Line(
                      width: MediaQuery.of(context).size.width / 4,
                    ),
                    Text(
                      " or ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Line(
                      width: MediaQuery.of(context).size.width / 4,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                NonCornerButton(
                  textButton: "Sign in",
                  textColor: Color(0xff676767),
                  borderRadius: 10,
                  padding: 0,
                  color: Color(0xffE6F5FC),
                  width: MediaQuery.of(context).size.width / 1.6,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
