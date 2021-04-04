import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:starworks_hireapp_flutter/src/ui/main/mainpage/mainPage.dart';
import 'src/ui/main/splash/splashScreen.dart';
import './src/ui/main/login/login.dart';
import './src/ui/main/mainpage/mainPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Color(0xFF535353)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        './src/ui/main/login/Login' : (BuildContext context) => new Login(),
        './src/ui/main/login/MainPage' : (BuildContext context) => new MainPage()
      },
    );
  }
}
