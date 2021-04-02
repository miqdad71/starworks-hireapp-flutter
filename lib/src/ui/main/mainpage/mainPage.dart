import 'package:flutter/material.dart';
import 'package:starworks_hireapp_flutter/src/ui/main/mainpage/hire/hire.dart';
import 'package:starworks_hireapp_flutter/src/ui/main/mainpage/search/search.dart';
import '../../../../constants.dart';
import './account/account.dart';
import './home/home.dart';
import './project/project.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _bottomNavCurrentIndex = 0;
  List<Widget> _container = [Home(), Search(), Hire(), Project(), Account()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _container[_bottomNavCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: primaryColor,
        onTap: (index) {
          setState(() {
            _bottomNavCurrentIndex = index;
          });
        },
        currentIndex: _bottomNavCurrentIndex,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: Text('Home',
                style: TextStyle(
                    color: _bottomNavCurrentIndex == 0
                        ? Colors.grey
                        : Colors.white)),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            title: Text('Search',
                style: TextStyle(
                    color: _bottomNavCurrentIndex == 1
                        ? Colors.grey
                        : Colors.white)),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.work,
              color: Colors.grey,
            ),
            icon: Icon(
              Icons.work,
              color: Colors.white,
            ),
            title: Text('Hiring',
                style: TextStyle(
                    color: _bottomNavCurrentIndex == 2
                        ? Colors.grey
                        : Colors.white)),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.assessment,
              color: Colors.grey,
            ),
            icon: Icon(
              Icons.assessment,
              color: Colors.white,
            ),
            title: Text('Project',
                style: TextStyle(
                    color: _bottomNavCurrentIndex == 3
                        ? Colors.grey
                        : Colors.white)),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.person,
              color: Colors.grey,
            ),
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: Text('Profile',
                style: TextStyle(
                    color: _bottomNavCurrentIndex == 4
                        ? Colors.grey
                        : Colors.white)),
          ),
        ],
      ),
    );
  }
}
