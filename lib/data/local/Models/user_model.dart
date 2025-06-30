import 'package:monety/data/local/db_helper/db_helper.dart';

class UserModel{
  int? userId;
  String userName;
  String email;
  String mobileNo;
  String password;

  UserModel({this.userId,required this.userName,required this.email,required this.mobileNo,required this.password});

  Map<String,dynamic> toMap(){
    return {
      DBHelper.COLUMN_USER_NAME:userName,
      DBHelper.COLUMN_USER_EMAIL:email,
      DBHelper.COLUMN_USER_MOB_NO:mobileNo,
      DBHelper.COLUMN_USER_PASS:password
    };
  }

  factory UserModel.fromMap(Map<String,dynamic> map){
    return UserModel(userId: map[DBHelper.COLUMN_USER_ID],userName: map[DBHelper.COLUMN_USER_NAME], email: map[DBHelper.COLUMN_USER_EMAIL], mobileNo: map[DBHelper.COLUMN_USER_MOB_NO], password: map[DBHelper.COLUMN_USER_PASS]);
  }
}