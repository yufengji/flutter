import 'package:flutter/material.dart';
import 'package:mmcm/model/detail/detail_model.dart';

class Scheme extends StatelessWidget {
  final FinancialPlan financialPlan;
  const Scheme({Key key, this.financialPlan}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('分期方案', style: TextStyle(fontSize: 20),),
              Text('含购置税 送1年保险', style: TextStyle(fontSize: 16, color: Color(0xff999999)),)
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Row(
              children: <Widget>[
                Container(
                  width: 100,
                  child: Text('首付', style: TextStyle(fontSize: 16, color: Color(0xff999999))),
                ),
                Container(
                  margin: EdgeInsets.only(left: 100),
                  child: Text('方案', style: TextStyle(fontSize: 16, color: Color(0xff999999))),
                )

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 5),
                  width: 100,
                  child: Text('10%', style: TextStyle(fontSize: 20, color: Colors.red),),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1, color: Color(0xff999999)))
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 100),

                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text('分期付款', style: TextStyle(fontSize: 20, color: Colors.white),),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text('购车时需另行支付车辆指导价*10%保证金（提车后返还）',style: TextStyle(fontSize: 16,color: Color(0xff999999)),),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text('月供方案', style: TextStyle(fontSize: 20),),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text('共计'+(financialPlan == null ? '' : financialPlan.stagesTermNumber.toString())+'期，每期'+(financialPlan == null ? '' : financialPlan.stagesTermRepaymentAmt.toString())+'元', style: TextStyle(fontSize: 20),),
          ),
        ],
      ),
    );
  }
}

