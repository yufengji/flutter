import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List list1 = [
    {'title': '订单', 'imgSrc': 'assets/images/icon_user_order.png'},
    {'title': '消息', 'imgSrc': 'assets/images/icon_user_news.png'},
    {'title': '浏览记录', 'imgSrc': 'assets/images/icon_user_history.png'},
  ];
  List list2 = [
    {'title': '服务保障', 'imgSrc': 'assets/images/icon_user_safeguard.png'},
    {'title': '企业介绍', 'imgSrc': 'assets/images/icon_user_introduce.png'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.white,
            height: 218,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xfff7f7f8),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: Image.asset('assets/images/default_avatar.png', width: 45, height: 45, fit: BoxFit.contain,),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffcccccc), width: 0.5)
                    ),
                    child: Text('立即登录'),
                  )
                ],
              ),
            ),
          ),
          _itemsList(list1),
          _itemsList(list2),
        ],
      ),
    );
  }
  _itemsList(list) {
    List<Widget> items = [];
    for(var i=0; i<list.length; i++) {
      items.add(_item(list[i]));
    }
    //return items;
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items,
      ),
    );
  }

  Widget _item(list) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Color(0xffe8e8e8)))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Image.asset(list['imgSrc'], width: 18, height: 18,),
                SizedBox(width: 10,),
                Text(list['title'], style: TextStyle(fontSize: 16),)
              ],
            ),
          ),
          Icon(Icons.keyboard_arrow_right)
        ],
      ),
    );
  }
}