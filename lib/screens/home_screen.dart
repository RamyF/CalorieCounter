import 'package:calorie_calculator/models/user.dart';
import 'package:calorie_calculator/screens/account_screen.dart';
import 'package:calorie_calculator/screens/history_screen.dart';
import 'package:calorie_calculator/screens/overview_screen.dart';
import 'package:calorie_calculator/services/db_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  String userID;

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
    var user = Provider.of<FirebaseUser>(context);
    String userID = user.uid;


    return StreamProvider<User>.value(
      value: DataBaseService().userStream(userID),
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF242424),
          elevation: 0.0,
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
                title: 'Home', icon: Icons.home, backgroundColor: Color(0xFF242424)),
            TitledNavigationBarItem(
                title: 'History',
                icon: Icons.show_chart,
                backgroundColor: Color(0xFF242424)),
            TitledNavigationBarItem(
                title: 'Account',
                icon: Icons.account_circle,
                backgroundColor: Color(0xFF242424)),
          ],
        ),
      ),
    );
  }
}
