import 'package:calorie_calculator/screens/account_screen.dart';
import 'package:calorie_calculator/screens/history_screen.dart';
import 'package:calorie_calculator/screens/overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  static final String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // bottom nav index
  int _currentTab = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Title/Logo',
          style: TextStyle(
              fontFamily: 'Opensans',
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          OverviewScreen(),
          HistoryScreen(),
          AccountScreen(),
        ],
        onPageChanged: (int index) {
          setState(() {
            _currentTab = index;
          });
        },
      ),
      bottomNavigationBar: TitledBottomNavigationBar(
        currentIndex: _currentTab,
        reverse: true,
        activeColor: Colors.red,
        curve: Curves.easeIn,
        onTap: (index) {
          setState(() {
            _currentTab = index;
          });
        },
        items: [
          TitledNavigationBarItem(title: 'Home', icon: Icons.home),
          TitledNavigationBarItem(title: 'History', icon: Icons.show_chart),
          TitledNavigationBarItem(title: 'Account', icon: Icons.account_circle),
        ],
      ),
    );
  }
}
