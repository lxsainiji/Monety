import 'dart:io';
import 'package:monety/data/local/Models/user_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{
  DBHelper._();

   static DBHelper getInstance(){
    return DBHelper._();
  }

  Database? mDb;

  ///user
  static const String TABLE_USER = "user";
  static const String COLUMN_USER_ID = "u_id";
  static const String COLUMN_USER_NAME = "u_name";
  static const String COLUMN_USER_EMAIL = "u_email";
  static const String COLUMN_USER_MOB_NO = "u_mob_no";
  static const String COLUMN_USER_PASS = "u_pass";

  ///expense
  static const String TABLE_EXPENSE = "expense";
  static const String COLUMN_EXPENSE_ID = "e_id";
  static const String COLUMN_EXPENSE_TITLE = "e_title";
  static const String COLUMN_EXPENSE_DESC = "e_desc";
  static const String COLUMN_EXPENSE_AMT = "e_amt";
  static const String COLUMN_EXPENSE_BAL = "e_bal";
  static const String COLUMN_EXPENSE_CAT_ID = "e_cat_id";
  static const String COLUMN_EXPENSE_TYPE = "e_type";
  static const String COLUMN_EXPENSE_CREATED_AT="e_created_at";

  Future<Database>InitDB()async{
     mDb = mDb ?? await openDB();
     return mDb!;
  }


  Future<Database> openDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "monety.db");

    return await openDatabase(path, version: 1, onCreate: (db,version){
         db.execute("CREATE TABLE $TABLE_USER ($COLUMN_USER_ID INTEGER PRIMARY KEY AUTOINCREMENT,$COLUMN_USER_NAME TEXT,$COLUMN_USER_EMAIL TEXT,$COLUMN_USER_PASS TEXT,$COLUMN_USER_MOB_NO TEXT)");
         db.execute("CREATE TABLE $TABLE_EXPENSE ($COLUMN_EXPENSE_ID INTEGER PRIMARY KEY AUTOINCREMENT, $COLUMN_USER_ID INTEGER, $COLUMN_EXPENSE_TITLE TEXT, $COLUMN_EXPENSE_DESC TEXT, $COLUMN_EXPENSE_AMT REAL, $COLUMN_EXPENSE_BAL REAL, $COLUMN_EXPENSE_TYPE INTEGER, $COLUMN_EXPENSE_CAT_ID INTEGER, $COLUMN_EXPENSE_CREATED_AT text");
      },
    );
  }

  ///queries
  Future<bool> registerUser({required UserModel newUser})async{
    var db=await InitDB();
    int rowEffected =await db.insert(TABLE_USER, newUser.toMap());
    return rowEffected > 0;
  }


  Future<bool> ifUserEmailExists({required String email}) async{
    var db = await InitDB();
    var data = await db.query(TABLE_USER, where: "$COLUMN_USER_EMAIL = ? ", whereArgs: [email]);
    return data.isNotEmpty;
  }

  Future<bool> ifUserMobNoExists({required String mobNo}) async{
    var db = await InitDB();
    var data = await db.query(TABLE_USER, where: "$COLUMN_USER_MOB_NO = ? ", whereArgs: [mobNo]);
    return data.isNotEmpty;
  }

  authenticateUser({required String email,required String pass})async{
    var db=await InitDB();
    var data =await db.query(TABLE_USER,where: "$COLUMN_USER_EMAIL = ? AND $COLUMN_USER_PASS = ? ",whereArgs: [email,pass]);
    return data.isNotEmpty;
  }

  addExpense(){}
}
