import 'package:flutter/material.dart';
import 'package:starworks_hireapp_flutter/constants.dart';

class Hire extends StatefulWidget {
  @override
  _HireState createState() => _HireState();
}

class _HireState extends State<Hire> {
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: const Text('Hiring Project'),
            bottom: TabBar(
              isScrollable: true,
              tabs: choices.map<Widget>((Choice choice) {
                return Tab(
                  iconMargin: const EdgeInsets.only(left: 30, right: 30),
                  text: choice.title,
                  icon: Icon(choice.icon)
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: choices.map((Choice choice){
              return Padding(
                padding: const EdgeInsets.all(16),
                child: ChoicePage(
                  choice: choice,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class Choice {
  final String title;
  final IconData icon;
  const Choice({this.title, this.icon});
}

const List<Choice> choices = <Choice>[
  Choice(title:  'Approve'),
  Choice(title:  'Wait'),
  Choice(title:  'Reject'),
];

class ChoicePage extends StatelessWidget {
  const ChoicePage({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              choice.icon,
              size: 150,
              color: textStyle.color,
            ),
            Text(
              choice.title,
              style: textStyle,
            )
          ],
        ),
      ),
    );
  }
}
