import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monety/ui/add_exp/add_exp.dart';
import 'package:monety/ui/home/home.dart';
import 'package:monety/ui/notification/notification.dart';
import 'package:monety/ui/profile/profile.dart';
import 'package:monety/ui/statistic/statistic.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentInx=0;
  List<Widget> pages = [HomePage(), Statistic(), AddExp(), NotificationPage(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentInx,
          selectedItemColor: Colors.pink.shade300,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index){
            currentInx=index;
            setState(() {});
          },
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled,size: 30,),label:"Home" ),
        BottomNavigationBarItem(icon: Icon(Icons.auto_graph,size: 30),label: "Statistic"),
        BottomNavigationBarItem(icon: Icon(Icons.add_box_rounded,color: Colors.pink.shade400,size: 55,),label: "Add"),
        BottomNavigationBarItem(icon: Icon(Icons.notifications_on,size: 30),label: "Notification"),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded,size: 30),label: "Profile"),
      ]),
      body: pages[currentInx]
    );
  }
}
