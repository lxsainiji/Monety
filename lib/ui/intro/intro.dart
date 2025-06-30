import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monety/ui/home/home.dart';
import 'package:monety/ui/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Intro extends StatefulWidget{
  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          children: [Column(
            children: [
              SizedBox(height: 140,),
              Image.asset("lib/assets/img/intro.png",width: 500,),
              Text("Save your money with Expense Tracker",textAlign: TextAlign.center,style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600
              ),),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text("Save money! The more your money works for you, the less you have to work for money.",textAlign: TextAlign.center,style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey
                ),),
              )
            ],
          ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 70),
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.pink.shade300,
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(22, 16), // X-radius, Y-radius
                  ),
                ),
                child: InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Login()));
                  },
                  child: Text("Let's Start",style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                  ),),
                ),
              ),
            )
          ]
        ),
      )
    );
  }
}