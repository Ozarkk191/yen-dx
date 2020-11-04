import 'package:flutter/material.dart';
import 'package:yen/page/navigation/navigation_page.dart';
import 'package:yen/page/register/register_page.dart';
import 'package:yen/widget_custom/button/back_button.dart';
import 'package:yen/widget_custom/button/non_corner_button.dart';
import 'package:yen/widget_custom/line/line.dart';
import 'package:yen/widget_custom/textfield/main_textfield.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg_profile.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BackButtonArrow(
                  callback: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 0),
                  width: MediaQuery.of(context).size.width - 60,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 70),
                        child: Image.asset(
                          "assets/images/frame2.png",
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              "assets/images/avater_profile.png",
                              width: 120,
                              height: 120,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "My Profile",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff3A79B1)),
                          ),
                          SizedBox(height: 2),
                          Line(width: 110),
                          SizedBox(height: 10),
                          MainTextField(
                            labelText: 'First name',
                          ),
                          SizedBox(height: 10),
                          MainTextField(
                            labelText: 'Last name',
                          ),
                          SizedBox(height: 10),
                          MainTextField(
                            labelText: 'Country',
                          ),
                          SizedBox(height: 10),
                          MainTextField(
                            labelText: 'YEN-D Sections',
                          ),
                          SizedBox(height: 10),
                          MainTextField(
                            labelText: 'Contact Tel',
                          ),
                          SizedBox(height: 10),
                          MainTextField(
                            labelText: 'E-mail',
                          ),
                          SizedBox(height: 10),
                          MainTextField(
                            labelText: 'Business',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                NonCornerButton(
                  textButton: "Submit",
                  textColor: Color(0xffffffff),
                  borderRadius: 40,
                  padding: 0,
                  color: Color(0xff80D3F6),
                  width: MediaQuery.of(context).size.width / 2.7,
                  textSize: 20,
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NavigationPage()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
