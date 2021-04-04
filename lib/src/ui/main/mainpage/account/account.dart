import 'package:flutter/material.dart';
import 'package:starworks_hireapp_flutter/src/ui/main/login/login.dart';
import '../../../../../constants.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: FlatButton(
              color: Colors.grey,
              onPressed: () => tampilOption(context),
              child: Text(
                'Log Out',
                style: kBodyTextBlack,
              ),
            ),
          ),
        ),
      ),
    );
  }

  tampilOption(BuildContext ctx) {
    showDialog(
        builder: (context) => SimpleDialog(
          title: Center(child: Text('Are you sure?')),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SimpleDialogOption(
                  child: Text('Yes'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                ),
                SimpleDialogOption(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),

          ],
        ),
        context: ctx);
  }

}
