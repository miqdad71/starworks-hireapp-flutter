import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:starworks_hireapp_flutter/constants.dart';
import 'package:starworks_hireapp_flutter/src/ui/main/forgotpassword/forgotPassword.dart';
import 'package:starworks_hireapp_flutter/src/ui/main/forgotpassword/components/background.dart';
import 'package:starworks_hireapp_flutter/src/ui/main/mainpage/mainPage.dart';
import 'package:starworks_hireapp_flutter/src/ui/main/signup/signup.dart';


class Body extends StatelessWidget {
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
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                              TextInput(
                                icon: FontAwesomeIcons.solidEnvelope,
                                hint: 'Email address',
                                inputType: TextInputType.emailAddress,
                                inputAction: TextInputAction.next,
                              ),
                              Text(
                                "Password",
                                style: kBodyTextWhite,
                              ),
                              PasswordInput(
                                icon: FontAwesomeIcons.lock,
                                hint: 'Your Password',
                                inputAction: TextInputAction.done,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left:220, bottom: 8),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
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
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return MainPage();
                          }));
                        },
                        child: Text(
                          'LOGIN',
                          style: kBodyTextWhite,
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 16, bottom: 16, top: 16),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
              },
            )
          ],
        ), context: ctx
    );
  }
}

class TextInput extends StatelessWidget {
  const TextInput({
    Key key,
    @required this.icon,
    @required this.hint,
    this.inputType,
    this.inputAction,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4)),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            border: InputBorder.none,
            hintText: hint,
            // prefixIcon: Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: Icon(
            //     icon,
            //     color: Colors.grey,
            //     size: 30,
            //   ),
            // ),
            hintStyle: kBodyText,
          ),
          style: kBodyText,
          keyboardType: inputType,
          textInputAction: inputAction,
        ),
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    Key key,
    @required this.icon,
    @required this.hint,
    this.inputAction,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputAction inputAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4)),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            border: InputBorder.none,
            hintText: hint,
            // prefixIcon: Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: Icon(
            //     icon,
            //     color: Colors.grey,
            //     size: 30,
            //   ),
            // ),
            hintStyle: kBodyText,
          ),
          obscureText: true,
          style: kBodyText,
          textInputAction: inputAction,
        ),
      ),
    );
  }
}
