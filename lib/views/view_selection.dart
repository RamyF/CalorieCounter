import 'package:flutter/material.dart';
import 'home_view.dart';
import 'add_views.dart';
import 'history_view.dart';
import '../main.dart';
// responsible for showing different views

class ViewSelection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ViewSelectionState();
  }
}

class _ViewSelectionState extends State<ViewSelection>
    with SingleTickerProviderStateMixin {
  // allows app to navigate between 3 choices
  int _currentIndex = 0;
  // different views
  final List<Widget> _views = [
    HomeView(),
    null, // TODO: retain functionality and setting list to 2 elements
    HistoryView(),
  ];
  TabController _addTabController;
  // add view tabs
  // tab display
  final List<Tab> addTabs = <Tab>[
    Tab(
      icon: Icon(Icons.fastfood),
    ),
    Tab(
      icon: Icon(Icons.poll),
    )
  ];

  @override
  void initState() {
    super.initState();
    _addTabController = TabController(length: addTabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _addTabController.dispose();
  }

  AppBar appBarDisplay(int index) {
    if (index == 1) {
      return AppBar(
        title: Text("Add"),
        bottom: TabBar(
          unselectedLabelColor: secondaryColor,
          controller: _addTabController,
          tabs: addTabs,
        ),
      );
    } else {
      return AppBar(
        title: Text(appBarText(_currentIndex)),
      );
    }
  }

  // displays different app bar text depending on selection
  String appBarText(int index) =>
      (index == 0) ? 'Home' : (index == 1) ? 'Add' : 'History';

  // checks if index is on add tab
  bool isOnAddView(int index) => (index == 1) ? true : false;

  Widget addViews() {
    return TabBarView(
      controller: _addTabController,
      children: <Widget>[
        AddFood(),
        LogWeight(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDisplay(_currentIndex),
      // app body that displays views based on menu selection
      body: isOnAddView(_currentIndex) ? addViews() : _views[_currentIndex],
      // bottom nav bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: secondaryColor,
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
}
