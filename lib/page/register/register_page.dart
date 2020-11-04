import 'package:flutter/material.dart';
import 'package:yen/page/login/login_page.dart';
import 'package:yen/page/profile/profile_page.dart';
import 'package:yen/widget_custom/button/back_button.dart';
import 'package:yen/widget_custom/button/non_corner_button.dart';
import 'package:yen/widget_custom/textfield/main_textfield.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg_main.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                BackButtonArrow(
                  callback: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 5.5,
                  ),
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/frame.png",
                        width: MediaQuery.of(context).size.width - 80,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 100),
                        width: MediaQuery.of(context).size.width - 80,
                        child: Column(
                          children: [
                            MainTextField(
                              labelText: 'E-mail',
                            ),
                            SizedBox(height: 10),
                            MainTextField(
                              labelText: 'Password',
                              obscureText: true,
                            ),
                            SizedBox(height: 40),
                            NonCornerButton(
                              textButton: "LOGIN",
                              textColor: Color(0xff676767),
                              borderRadius: 10,
                              padding: 0,
                              color: Color(0xffE6F5FC),
                              width: MediaQuery.of(context).size.width / 2,
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfilePage()));
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text("Already have an account?")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
