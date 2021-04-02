import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:starworks_hireapp_flutter/constants.dart';
import 'package:starworks_hireapp_flutter/src/ui/main/login/login.dart';
import 'package:starworks_hireapp_flutter/src/ui/main/onboard/components/background.dart';
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
                    SizedBox(
                      height: 300,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Center(
                        child: Text(
                          'FIND TALENTED & BEST DEVELOPERS IN VARIOUS FIELDS OF EXPERTISE',
                          style: kHeading,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 64,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6)),
                                child: FlatButton(
                                  // ignore: deprecated_member_use
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return Login();
                                    }));
                                  },
                                  child: Text(
                                    'LOGIN',
                                    style: kBodyTextBlack,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white
                                    ),
                                    height: 2,
                                    width: 160,
                                    margin: EdgeInsets.all(4),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 8,horizontal: 4),
                                    child: Text(
                                      'or',
                                      style: kBodyTextWhite,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white
                                    ),
                                    height: 2,
                                    width: 160,
                                    margin: EdgeInsets.all(4),
                                  ),
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: BorderRadius.circular(6)),
                                child: FlatButton(
                                  // ignore: deprecated_member_use
                                  onPressed: () => tampilOption(context),
                                  child: Text(
                                    'SIGN UP',
                                    style: kBodyTextWhite,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
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
