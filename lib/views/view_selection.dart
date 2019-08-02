import 'package:flutter/material.dart';
import 'home_view.dart';
import 'add_view.dart';
import 'history_view.dart';
import '../main.dart';

// responsible for showing different views based on bottom nav bar selection

class ViewSelection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ViewSelectionState();
  }
}

class _ViewSelectionState extends State<ViewSelection> {
  // allows app to navigate between 3 choices
  int _currentIndex = 0;
  // different views
  final List<Widget> _views = [
    HomeView(),
    AddView(),
    HistoryView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarText(_currentIndex)),
      ),
      // app body that displays views based on menu selection
      body: _views[_currentIndex],
      // bottom nav bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primaryColor,
        selectedItemColor: secondaryColor,
        unselectedItemColor: Colors.white,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            title: Text("Add"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text("History"),
          ),
        ],
      ),
    );
  }

  // sets which view to be displayed
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // displays different app bar text depending on selection
  String appBarText(int currentIndex) => (currentIndex == 0) ? 'Home' : (currentIndex == 1) ? 'Add' : 'History';
  
}
