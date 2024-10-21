import 'dbhelper.dart';

class TipModel {
  int? tipid;
  int? totalamount;
  int? totaltip;
  int? tippercent;
  int? perpersonamount;
  int? noofperson;

  TipModel(
      {this.tipid,
      required this.totalamount,
      required this.totaltip,
      required this.tippercent,
      required this.perpersonamount,
      required this.noofperson});

  factory TipModel.fromMap(Map<String, dynamic> map) {
    return TipModel(
        tipid: map[DbHelper.Tip_id],
        totalamount: map[DbHelper.Tip_totalamount],
        totaltip: map[DbHelper.Tip_totaltip],
        tippercent: map[DbHelper.Tip_tippercent],
        perpersonamount: map[DbHelper.Tip_perpersonamount],
        noofperson: map[DbHelper.Tip_noofperson]);
  }

  Map<String, dynamic> toMap() {
    return {
      DbHelper.Tip_id: tipid,
      DbHelper.Tip_totalamount: totalamount,
      DbHelper.Tip_totaltip: totaltip,
      DbHelper.Tip_tippercent: tippercent,
      DbHelper.Tip_perpersonamount: perpersonamount,
      DbHelper.Tip_noofperson: noofperson
    };
  }
}
