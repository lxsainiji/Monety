import 'package:monety/data/local/db_helper/db_helper.dart';

class ExpanseModel{
  String? eId;
  String userId;
  String eTitle;
  String eDes;
  String eAmt;
  String eBal;
  String eCatId;
  String eType;
  String eCreatedAt;

  ExpanseModel({required this.userId,required this.eTitle, required this.eDes, required this.eAmt, required this.eBal, required this.eCatId, required this.eType, required this.eCreatedAt});

  Map<String, dynamic> toMap(){
    return {
      DBHelper.COLUMN_EXPENSE_TITLE:eTitle,
      DBHelper.COLUMN_EXPENSE_DESC:eDes,
      DBHelper.COLUMN_EXPENSE_AMT:eAmt,
      DBHelper.COLUMN_EXPENSE_BAL:eBal,
      DBHelper.COLUMN_EXPENSE_CAT_ID:eCatId,
      DBHelper.COLUMN_EXPENSE_TYPE:eType,
      DBHelper.COLUMN_EXPENSE_CREATED_AT: DateTime.now().millisecondsSinceEpoch.toString()
    };
  }

  factory ExpanseModel.fromMap(Map<String,dynamic> map){
    return ExpanseModel(
        // eId: map[DBHelper.COLUMN_EXPENSE_ID],
        userId: map[DBHelper.COLUMN_USER_ID],
        eTitle: map[DBHelper.COLUMN_EXPENSE_TITLE],
        eDes: map[DBHelper.COLUMN_EXPENSE_DESC],
        eAmt: map[DBHelper.COLUMN_EXPENSE_AMT],
        eBal: map[DBHelper.COLUMN_EXPENSE_BAL],
        eCatId: map[DBHelper.COLUMN_EXPENSE_CAT_ID],
        eType: map[DBHelper.COLUMN_EXPENSE_TYPE],
        eCreatedAt: map[DBHelper.COLUMN_EXPENSE_CREATED_AT]
    );
  }
}