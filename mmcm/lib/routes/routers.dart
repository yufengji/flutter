import 'package:flutter/material.dart';
import 'package:mmcm/navigator/tab_navigator.dart';
import 'package:mmcm/pages/citySelect.dart';
import 'package:mmcm/pages/detailPage.dart';

// 配置路由
final routes = {
  '/citySelect': (context) => CitySelect(),
  '/': (context) => TabNavigator(),
  '/detail': (context, {arguments}) => DetailPage(arguments: arguments)
};

//路由传参
var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if(pageContentBuilder != null){
    if(settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) => pageContentBuilder(context, arguments: settings.arguments)
      );
      return route;
    }else{
      final Route route = MaterialPageRoute(
          builder: (context) => pageContentBuilder(context)
      );
      return route;
    }
  }
};