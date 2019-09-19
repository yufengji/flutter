import 'package:flutter/material.dart';
import 'package:mmcm/pages/homePage.dart';
import 'package:mmcm/pages/myPage.dart';
import 'package:mmcm/pages/zhunPage.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.red;
  int _currentIndex = 0;
  final _controller = PageController(
    initialPage: 0
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          ZhunPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        onTap: (index){
          this._controller.jumpToPage(index);
          setState(() {
            this._currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/tab_new_default@2x.png", width: 48, height: 34,),
            activeIcon: Image.asset("assets/images/tab_new_Active@2x.png", width: 48, height: 34,),
            title: Text("新车", style: TextStyle(color: this._currentIndex == 0 ? this._activeColor : this._defaultColor),)
          ),
          BottomNavigationBarItem(
              icon: Image.asset("assets/images/tab_old_default@2x.png", width: 48, height: 34,),
              activeIcon: Image.asset("assets/images/tab_old_Active@2x.png", width: 48, height: 34,),
              title: Text("准新车", style: TextStyle(color: this._currentIndex == 1 ? this._activeColor : this._defaultColor),)
          ),
          BottomNavigationBarItem(
              icon: Image.asset("assets/images/tab_user_default@2x.png", width: 48, height: 34,),
              activeIcon: Image.asset("assets/images/tab_user_Active@2x.png", width: 48, height: 34,),
              title: Text("我的", style: TextStyle(color: this._currentIndex == 2 ? this._activeColor : this._defaultColor),)
          )
        ]
      ),
    );
  }
}
