import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:starworks_hireapp_flutter/constants.dart';
import 'package:starworks_hireapp_flutter/src/ui/main/forgotpassword/components/background.dart';
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
                        'Please fill the email below correctly',
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
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(6)),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        // ignore: deprecated_member_use
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return ResetPassword();
                          }));
                        },
                        child: Text(
                          'NEXT',
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


