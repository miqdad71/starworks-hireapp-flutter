import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starworks_hireapp_flutter/constants.dart';
import 'package:starworks_hireapp_flutter/src/ui/main/forgotpassword/forgotPassword.dart';
import 'package:starworks_hireapp_flutter/src/ui/main/forgotpassword/components/background.dart';
import 'package:starworks_hireapp_flutter/src/ui/main/signup/signup.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  bool visible = false;

  @override
  initState(){
    super.initState();
  }

  signIn(String email, String password) async {
    String url = "http://54.210.205.208:4000/account/login";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map body = {"email": email, "password": password};
    var jsonResponse;
    var res = await http.post(url, body: body);
    if (res.statusCode == 200) {
      jsonResponse = json.decode(res.body);

      print("Response status: ${res.statusCode}");
      print("Response status: ${res.body}");

      if (jsonResponse != null) {
        setState(() {
          visible = false;
        });

        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushNamedAndRemoveUntil(
          './src/ui/main/login/MainPage', (Route<dynamic> route) => false);
        /*
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => MainPage()),
                (Route<dynamic> route) => false);*/
      } else {
        setState(() {
          visible = false;
        });
        print("Response status: ${res.body}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background(),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/starworks_logo.png',
                      width: 200,
                      height: 100,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Text(
                        'LOGIN',
                        style: kHeadingBasic,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(16, 16, 0, 40),
                      child: Text(
                        'Please login with your email and password',
                        style: kBodyTextWhite,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email",
                                style: kBodyTextWhite,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white, borderRadius: BorderRadius.circular(4)),
                                  child: TextField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                      border: InputBorder.none,
                                      hintText: ("ex : myname@gmail.com"),
                                      hintStyle: kBodyText,
                                    ),
                                    style: kBodyTextBlack,
                                  ),
                                ),
                              ),
                              Text(
                                "Password",
                                style: kBodyTextWhite,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white, borderRadius: BorderRadius.circular(4)),
                                  child: TextField(
                                    controller: _passController,
                                    decoration: InputDecoration(
                                      contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                      border: InputBorder.none,
                                      hintText: ("minimum 8 character"),
                                      hintStyle: kBodyText,
                                    ),
                                    obscureText: true,
                                    style: kBodyTextBlack,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 220, bottom: 8),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ForgotPassword();
                          }));
                        },
                        child: Text(
                          'Forget password?',
                          style: kBodyTextWhiteBold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(6)),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        onPressed: /*_emailController.text == "" ||
                                _passController.text == ""
                            ? null
                            :*/ () {
                                setState(() {
                                  visible = true;
                                });
                                signIn(_emailController.text,
                                    _passController.text);
                              },
                        child: Text(
                          'LOGIN',
                          style: kBodyTextWhite,
                        ),
                      ),
                    ),
                    Center(
                      child: Visibility(
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        visible: visible,
                        child: Container(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(left: 16, bottom: 16, top: 16),
                          child: Center(
                            child: Text(
                              "You don't have an account?",
                              style: kBodyTextWhite,
                            ),
                          ),
                        ),
                        Container(
                          child: FlatButton(
                            onPressed: () => tampilOption(context),
                            child: Text(
                              'Sign up',
                              style: kBodyTextWhiteBold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ))
      ],
    );
  }

  tampilOption(BuildContext ctx) {
    showDialog(
        builder: (context) => SimpleDialog(
              title: Text('Sign up as?'),
              children: [
                SimpleDialogOption(
                  child: Text('Engineer (Worker)'),
                  onPressed: () {
                    debugPrint('Wise choice 2');
                    // Navigator.of(context).pop();
                  },
                ),
                SimpleDialogOption(
                  child: Text('Company (Recruiter)'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                )
              ],
            ),
        context: ctx);
  }
}
