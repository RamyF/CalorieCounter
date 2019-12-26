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
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _currentTab = 2;
                _pageController.jumpToPage(_currentTab);
              });
            },
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage:
                  NetworkImage('https://i.redd.it/dmdqlcdpjlwz.jpg'),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Logo',
          style: TextStyle(
              fontFamily: 'Opensans',
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('add'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: TitledBottomNavigationBar(
        inactiveColor: Colors.grey,
        indicatorColor: Theme.of(context).primaryColor,
        inactiveStripColor: Colors.black,
        currentIndex: _currentTab,
        reverse: true,
        activeColor: Theme.of(context).primaryColor,
        curve: Curves.easeIn,
        onTap: (index) {
          setState(() {
            _currentTab = index;
            _pageController.jumpToPage(_currentTab);
          });
        },
        items: [
          TitledNavigationBarItem(
              title: 'Home', icon: Icons.home, backgroundColor: Colors.black),
          TitledNavigationBarItem(
              title: 'History',
              icon: Icons.show_chart,
              backgroundColor: Colors.black),
          TitledNavigationBarItem(
              title: 'Account',
              icon: Icons.account_circle,
              backgroundColor: Colors.black),
        ],
      ),
    );
  }
}
