import 'package:monety/data/local/Models/user_model.dart';

abstract class UserEvents{}

class RegisterEvent extends UserEvents{
  UserModel mUser;
  RegisterEvent({required this.mUser});
}


class AuthenticateEvent extends UserEvents{
  String email;
  String password;
  AuthenticateEvent({required this.email,required this.password});
}


















// import 'package:monety/data/local/Models/user_model.dart';
//
// abstract class UserEvent{}
//
// class UserRegisterEvent extends UserEvent{
//   UserModel mUser;
//   UserRegisterEvent({required this.mUser});
// }