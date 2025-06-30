import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monety/data/local/db_helper/db_helper.dart';
import 'package:monety/data/local/repository/user_repo.dart';
import 'package:monety/ui/intro/intro.dart';
import 'package:monety/ui/signup/bloc/user_bloc.dart';

void main(){
  runApp(BlocProvider(create: (_)=>UserBloc(userRepo:UserRepository(db: DBHelper.getInstance())),child: MyApp(),));
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Intro(),
    );
  }
}
