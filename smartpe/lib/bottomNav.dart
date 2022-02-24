import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './homepage.dart';
import './profile.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key key, this.currentIndex, this.uid}) : super(key: key);  
  final int currentIndex;
  final String uid;
  
  @override
  _BottomNavBarState createState() => _BottomNavBarState(currentIndex);
}

class _BottomNavBarState extends State<BottomNavBar> {
  _BottomNavBarState(this.currentIndex);  
  
  final int currentIndex;
  var currentPage;
  final List<BottomNavigationBarItem> ButtonList = [
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home), title: Text('Record')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), title: Text('Profile')),
  ];
  final List PageList = [HomePage(), ProfilePage()];
  @override
  void initState() {
    currentPage = PageList[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        items: ButtonList,
        onTap: (index) {
          int currentIndex = index;
          currentPage = PageList[currentIndex];
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => currentPage));
        },
        type: BottomNavigationBarType.fixed);
  }
}
