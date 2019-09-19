import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mmcm/dao/home_dao.dart';
import 'package:mmcm/model/home/banner_model.dart';
import 'package:mmcm/model/city_model.dart';
import 'package:mmcm/model/home/deptid_model.dart';
import 'package:mmcm/model/home/trad_model.dart';
import 'package:mmcm/widget/car_list.dart';
import 'package:mmcm/widget/home/search.dart';
import 'package:mmcm/widget/loading_container.dart';
import 'package:mmcm/widget/webview.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:city_pickers/city_pickers.dart';
const APPBAR_SCROLL_OFFSET = 220;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String bannerMsg = '';
  Data bannerList;
  // String city = '厦门市';
  CityInfo city;
  bool _loading = true;
  DeptId deptId;
  TradData carList;
  double appBarAlpha = 0;
  double colorOpacity = 0.38;
  var fontColor = [250,250,250];
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: LoadingContainer(
        isLoading: _loading,
        child: Stack(
          children: <Widget>[
            MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: RefreshIndicator(
                  onRefresh: _loadData,
                  child: NotificationListener(
                    onNotification: (scrollNotification){
                      if(scrollNotification is ScrollUpdateNotification && scrollNotification.depth == 0){
                        _onScroll(scrollNotification.metrics.pixels);
                      }
                    },
                    child:  ListView(
                      children: <Widget>[
                        Container(
                          height: 220,
                          child: Stack(
                            children: <Widget>[
                              Swiper(
                                itemCount: bannerList == null ? 0 : bannerList.list.length,
                                autoplay: false,
                                itemBuilder: (BuildContext context, int index){
                                  return GestureDetector(
                                    onTap: (){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => WebView(url: bannerList.list[index].link,))
                                      );
                                    },
                                    child: Image.network(
                                      bannerList == null ? '' : bannerList.list[index].imgUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                                pagination: bannerList == null ? null : bannerList.list.length == 1 ? null : SwiperPagination(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: SearchBox(),
                        ),
                        Container(
                          color: Colors.white,
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
//                decoration: BoxDecoration(
//                  border: Border(left: BorderSide(color: Colors.red, width: 2))
//                ),
                                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    child: Text('热门车型', style: TextStyle(fontSize: 16, color: Color(0xff666666)),),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    child: Text('查看全部新车', style: TextStyle(fontSize: 14, color: Color(0xff666666)),),
                                  )
                                ],
                              ),
                              CarList(carList: carList == null ? [] : carList.hotVehicles,)
                            ],
                          ),
                          //child: CarList(carList: carList,),
                        )
                      ],
                    ),
                  ),
                )
            ),
            Opacity(
              opacity: this.appBarAlpha,
              child: Container(
                height: 80,
                padding: EdgeInsets.fromLTRB(120, 40, 70, 0),
                decoration: BoxDecoration(color: Colors.white),
                child: Center(
                  child: Container(

                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Color(0xfff7f7f8),
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: TextField(
                      decoration:InputDecoration(
                        hintText: "品牌、车系、车型",
                        border: InputBorder.none,
                        icon: Icon(Icons.search),
                        contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 5)
                      ),
                    )
                  ),
                ),
              ),
            ),

            Positioned(
              top: 40,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 90,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(00,00,00, colorOpacity),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: GestureDetector(
                      onTap: () async{
                        // 使用city_pickers插件做城市选择列表
//                              Result tempResult = await CityPickers.showCitiesSelector(
//                                context: context,
//                                title: "选择城市"
//                              );
//                              if (tempResult == null) {
//                                return ;
//                              }
//                              this.setState(() {
//                                city = tempResult.cityName;
//                              });
                        // 不用插件开发城市选择列表
                        Navigator.pushNamed(context, '/citySelect').then((data){
                          setState(() {
                            city = data;
                            _loading = true;
                          });
                          _loadData();
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 50,
                            child: Text(city == null ? '厦门市' : city.name, style: TextStyle(fontSize: 14, color: Color.fromRGBO(fontColor[0], fontColor[1], fontColor[2], 1.0)), maxLines: 1, overflow: TextOverflow.ellipsis,),
                          ),
                          Icon(Icons.keyboard_arrow_down, size: 24, color: Color.fromRGBO(fontColor[0], fontColor[1], fontColor[2], 1.0),)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        shape: BoxShape.circle
                    ),
                    child: IconButton(
                        icon: Image.asset('assets/images/icon_tel_white@2x.png',width: 26, height: 26),
                        highlightColor: Colors.black,
                        splashColor: Colors.red,
                        onPressed: (){
                          doCall('tel:13599504385');
                        }
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }

  Future<Null> _loadData() async{
    try{
      //BannerDao w = new BannerDao(param: param);
       var model = await new CommonRequest(
        param: {
          'cityCode': city == null ? '110100' : city.code,
          'type': 3
        },
        url: 'action/cms/app/mobileBannerImg',
        method: 'post'
      ).fetch();
      var model2 = await new CommonRequest(
        param: {
          'cityName': city == null ? '北京市' : city.name,
        },
        method: 'post',
        url: 'action/dept/getByCityName'
      ).fetch();
      var model3 = await new CommonRequest(
        param: {
          'cityCode': city == null ? '110100' : city.code,
          'deptId': DeptIdModel.fromJson(model2).data.deptId
        },
        url: 'action/trade/app/tradeGetNewModel',
        method: 'post'
      ).fetch();
      setState(() {
        bannerMsg = BannerModel.fromJson(model).msg;
        bannerList = BannerModel.fromJson(model).data;
        carList = TradModel.fromJson(model3).data;
        _loading = false;
      });
    }catch(e){
      setState(() {
        _loading = false;
      });
      print(e);
    }
  }

  void _onScroll(double pixels) {
    double alpha = pixels / APPBAR_SCROLL_OFFSET;
    double opacity = 0.38/APPBAR_SCROLL_OFFSET * (APPBAR_SCROLL_OFFSET-pixels);
    if(alpha < 0){
      alpha = 0;
    }else if(alpha > 1){
      alpha = 1;
    }
    if(opacity < 0) {
      opacity = 0;
    }
    if(opacity < 0.1){
      this.fontColor = [00, 00, 00];
    }else{
      this.fontColor = [255, 255, 255];
    }
    setState(() {
      this.appBarAlpha = alpha;
      this.colorOpacity = opacity;
    });
  }

  Future<void> doCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
