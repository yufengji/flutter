import 'package:flutter/material.dart';
import 'package:mmcm/model/home/trad_model.dart';

class CarList extends StatelessWidget {
  //final TradData carList;
  final List carList;

  const CarList({Key key, this.carList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _itemList(context)
      ],
    );
  }

  _itemList(BuildContext context) {
    if(carList.length == 0) return _itemNull(context);
    List<Widget> items = [];
    carList.forEach((model){
      items.add(_item(context, model));
    });
  //  print(items);
    return Column(
      children: items,
    );
  }

  Widget _itemNull(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: 0.5, color: Color(0xffcccccc)))
      ),
      child: Center(
        child: Text('您所在的城市暂无数据换个城市试试', style: TextStyle(fontSize: 18, color: Color(0xff666666)),),
      ),
    );
  }

  Widget _item(BuildContext context ,HotVehicles model) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/detail', arguments: {
          "id": model.id
        });
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Color(0xffececec), width: 1))
        ),
        child: Row(
          children: <Widget>[
            Image.network(model.picUrl, width: 115, height: 77,),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(model.brandName+model.seriesName, style: TextStyle(fontSize: 16)),
                  Text(model.modelName),
                  Row(
                    children: <Widget>[
                      Text('首付 '),
                      Text(model.lowFirstMoney, style: TextStyle(color: Colors.red),),
                      Text('元  月供 '),
                      Text(model.monthMoney, style: TextStyle(color: Colors.red),)
                    ],
                  )
                  //Text('首付 '+model.lowFirstMoney+'元 月供 '+model.monthMoney+' 元'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
