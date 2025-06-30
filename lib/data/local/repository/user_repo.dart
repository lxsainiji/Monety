import 'package:monety/data/local/Models/user_model.dart';
import 'package:monety/data/local/db_helper/db_helper.dart';

class UserRepository{
  DBHelper db;
  UserRepository({required this.db});
  ///1->success
  ///2->failure(email already exists)
  ///2->failure(mobNo already exists)
  ///4->error
  UserRegister({required UserModel newUser})async{
    if(await db.ifUserEmailExists(email: newUser.email)){
      return 2;
    }
    else if(await db.ifUserMobNoExists(mobNo: newUser.mobileNo)){
      return 3;
    }
    else{
      bool check =await db.registerUser(newUser: newUser);
      if(check){
        return 1;
      }else{
        return 4;
      }
    }
  }

  ///1->Authenticate
  ///2->User not Found
  authenticateUserRepo({required String email, required String pass})async{
    if(await db.authenticateUser(email:email,pass:pass)){
      return 1;
    }else{
      return 2;
    }
  }
}














// import 'package:monety/data/local/Models/user_model.dart';
// import 'package:monety/data/local/db_helper/db_helper.dart';
//
// class UserRepository {
//   DBHelper mDB;
//   UserRepository({required this.mDB});
//   //1->success
//   //2->failure
//   //3->error
//   //Events
//   registerUser({required UserModel newUser})async{
//     if(await mDB.ifUserExists(email: newUser.email)){
//       return 2;
//     }
//     else{
//       bool check = await mDB.registerUser(newUser: newUser);
//       if(check){
//         return 1;
//       }
//       else{
//         return 3;
//       }
//     }
//   }
//   authenticateUser(){}
// }