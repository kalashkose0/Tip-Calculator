import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tip_calculator/tipModel.dart';

class DbHelper {
  static final DbHelper db = DbHelper();

  Database? database;

  static const Tip_table = "tip_table";
  static const Tip_id = "tip_id";
  static const Tip_totalamount = "totalamount";
  static const Tip_totaltip = "totaltip";
  static const Tip_tippercent = "tippercent";
  static const Tip_perpersonamount = "perpersonamount";
  static const Tip_noofperson = "noofperson";

  Future<Database> getDb() async {
    if (database != null) {
      return database!;
    } else {
      return await initDb();
    }
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    var dbpath = await directory.path + "tipdb.db";
    return openDatabase(dbpath, version: 1, onCreate: (db, version) {
      db.execute(
          "create table $Tip_table ( $Tip_id integer primary key autoincrement, $Tip_totalamount text, $Tip_totaltip text, $Tip_tippercent text, $Tip_perpersonamount text, $Tip_noofperson text ) ");
    });
  }

  Future<bool> addTip(TipModel tipmodel) async {
    var db = await getDb();
    int rowseffect = await db.insert(Tip_table, tipmodel.toMap());
    return rowseffect > 0;
  }

  Future<List<TipModel>> fetchTips() async {
    var db = await getDb();
    List<Map<String, dynamic>> tips = await db.query(Tip_table);
    List<TipModel> listNotes = [];
    for (Map<String, dynamic> tipsdata in tips) {
      TipModel tipModel = TipModel.fromMap(tipsdata);
      listNotes.add(tipModel);
    }
    return listNotes;
    
  }
}
