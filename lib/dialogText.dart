import 'package:flutter/material.dart';
import 'package:starworks_hireapp_flutter/src/ui/main/signup/signup.dart';

class DialogText extends StatefulWidget {
  @override
  _DialogTextState createState() => _DialogTextState();
}

class _DialogTextState extends State<DialogText> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var _appBar = AppBar(
      title: Text('Test Dialog'),
      centerTitle: true,
    );

    var _body = Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RaisedButton(
              child: Text('Show Alert'),
              onPressed: () => tampilDialog(context)),
          SizedBox(
            height: 8,
          ),
          RaisedButton(
              child: Text('Show Option'),
              onPressed: () => tampilOption(context)),
          SizedBox(
            height: 8,
          ),
          RaisedButton(child: Text('Show Snackbar'), onPressed: () {})
        ],
      ),
    );

    return Scaffold(
      key: _key,
      appBar: _appBar,
      body: _body,
    );
  }

  tampilDialog(BuildContext ctx) {
    showDialog(
        builder: (context) => AlertDialog(
              title: Text('Halo'),
              content: Text('Halo Guys !!'),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'))
              ],
            ),
        context: ctx,
        barrierDismissible: false);
  }

  tampilOption(BuildContext ctx) {
    showDialog(
      builder: (context) => SimpleDialog(
        title: Text('Sign up as?'),
        children: [
          SimpleDialogOption(
            child: Text('Engineer (Worker)'),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
            },
          ),
          SimpleDialogOption(
            child: Text('Company (Recruiter)'),
            onPressed: () {
              debugPrint('Wise choice 2');
              Navigator.of(context).pop();
            },
          )
        ],
      ), context: ctx
    );
  }

}
