import 'package:flutter/material.dart';
import 'package:monety/ui/home/home.dart';
import 'package:monety/ui/intro/intro.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EntryPage extends StatefulWidget {
  @override
  State<EntryPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<EntryPage> {

  @override
  void initState() {
    super.initState();
    checkFirstSeen();
  }

  Future<void> checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? seen = prefs.getBool('seen');

    if (seen != null && seen) {
      // Already seen, navigate to Home
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (_) => HomePage()),
      );
    } else {
      // First time, set seen true and navigate to Intro
      await prefs.setBool('seen', true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Intro()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}