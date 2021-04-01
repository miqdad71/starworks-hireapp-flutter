import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:starworks_hireapp_flutter/constants.dart';
import 'package:starworks_hireapp_flutter/src/ui/main/resetpassword/components/background.dart';
import 'package:starworks_hireapp_flutter/src/ui/main/resetpassword/resetpassword.dart';

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
                        'RESET PASSWORD',
                        style: kHeadingBasic,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(16, 16, 0, 40),
                      child: Text(
                        'Please fill the new password and password confirmation below correctly',
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
                                "New Password",
                                style: kBodyTextWhite,
                              ),
                              PasswordInput(
                                icon: FontAwesomeIcons.lock,
                                hint: 'New Password',
                                inputAction: TextInputAction.done,
                              ),
                              Text(
                                "Confirm Password",
                                style: kBodyTextWhite,
                              ),
                              ConfirmPasswordInput(
                                icon: FontAwesomeIcons.lock,
                                hint: 'Confirm Password',
                                inputAction: TextInputAction.done,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(6)),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        // ignore: deprecated_member_use
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context){
                          //   return Login();
                          // }));
                        },
                        child: Text(
                          'RESET PASSWORD',
                          style: kBodyTextWhite,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ))
      ],
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

class ConfirmPasswordInput extends StatelessWidget {
  const ConfirmPasswordInput({
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
