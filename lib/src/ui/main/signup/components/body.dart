import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:starworks_hireapp_flutter/constants.dart';
import 'package:starworks_hireapp_flutter/src/model/user.dart';
import 'package:starworks_hireapp_flutter/src/ui/main/login/login.dart';
import 'package:starworks_hireapp_flutter/src/ui/main/signup/components/background.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailAddressController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _companyController = TextEditingController();
  TextEditingController _positionController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmationController =
      TextEditingController();

  Future<User> userSignUp(
    String fullName,
    String email,
    String phoneNumber,
    String company,
    String position,
    String password,
  ) async {
    const url = "http://54.210.205.208:4000/account";
    Map<String, dynamic> requestPayload = {
      "ac_name": fullName,
      "ac_email": email,
      "ac_phone": phoneNumber,
      "cn_company": company,
      "cn_position": position,
      "ac_password": password,
      "ac_level": 1,
    };

    final http.Response response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestPayload));
    if (response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Fail to sign up user");
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
                        'SIGN UP',
                        style: kHeadingBasic,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(16, 16, 0, 40),
                      child: Text(
                        'Please fill the form below correctly',
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
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: _fullNameController,
                                style: kBodyTextWhite,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: 'ex : Jonathan Abdul',
                                    hintStyle: kBodyTextWhite,
                                    labelText: 'Full Name',
                                    labelStyle: kBodyTextBig),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: _emailAddressController,
                                style: kBodyTextWhite,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: 'ex : your@mail.com',
                                    hintStyle: kBodyTextWhite,
                                    labelText: 'Email Address',
                                    labelStyle: kBodyTextBig),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: _companyController,
                                style: kBodyTextWhite,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: 'ex : PT Bangkit Harapan',
                                    hintStyle: kBodyTextWhite,
                                    labelText: 'Company Name',
                                    labelStyle: kBodyTextBig),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: _positionController,
                                style: kBodyTextWhite,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: 'ex : Staff',
                                    hintStyle: kBodyTextWhite,
                                    labelText: 'Position',
                                    labelStyle: kBodyTextBig),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: _passwordController,
                                style: kBodyTextWhite,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: 'ex : 0812********',
                                    hintStyle: kBodyTextWhite,
                                    labelText: 'Phone Number',
                                    labelStyle: kBodyTextBig),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                style: kBodyTextWhite,
                                obscureText: true,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: 'minimum 8 character',
                                    hintStyle: kBodyTextWhite,
                                    labelText: 'Password',
                                    labelStyle: kBodyTextBig),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                style: kBodyTextWhite,
                                obscureText: true,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText:
                                        'type the same as your password above',
                                    hintStyle: kBodyTextWhite,
                                    labelText: 'Password Confirmation',
                                    labelStyle: kBodyTextBig),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(6)),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        // ignore: deprecated_member_use
                        onPressed: () {},
                        child: Text(
                          'SIGN UP',
                          style: kBodyTextWhite,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 16, bottom: 16),
                          child: Center(
                            child: Text(
                              "You have an account?",
                              style: kBodyTextWhite,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 16),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Login();
                              }));
                            },
                            child: Text(
                              'Login here',
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
}
