import 'package:flutter/material.dart';
import 'pages.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}


class _HomeState extends State<Home>{
  int _currentIndex = 0;
  final List<Widget> _views = [
    HomesView(),
    AddView(),
    HistoryView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calorie Counter'),
        ),
        body: _views[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
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

  void onTabTapped(int index) {
    setState(() {
     _currentIndex = index; 
    });
  }
}

