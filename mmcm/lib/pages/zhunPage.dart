import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mmcm/dao/home_dao.dart';
import 'package:mmcm/model/city_model.dart';
import 'package:mmcm/model/zhun/trad_old_model.dart';
import 'package:mmcm/model/zhun/zhun_banner_model.dart';
import 'package:mmcm/widget/car_list.dart';
import 'package:mmcm/widget/loading_container.dart';
import 'package:mmcm/widget/webview.dart';

class ZhunPage extends StatefulWidget {
  @override
  _ZhunPageState createState() => _ZhunPageState();
}

class _ZhunPageState extends State<ZhunPage> {
  bool _loading = true;
  List<BannerList> bannerList = [];
  List<tradList> carList = [];
  CityInfo city;
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
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  Container(

                    //decoration: BoxDecoration(border: Border(top: BorderSide(width: 1, color: Color(0xffcccccc)), left: BorderSide.none, right: BorderSide.none, bottom: BorderSide.none)),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(top: 58),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(top: BorderSide(width: 1, color: Color(0xffcccccc)),bottom: BorderSide(width: 1, color: Color(0xffcccccc)))
                    ),
                    child: Text('近期活动', style: TextStyle(fontSize: 20),),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(20),
                    height: 205,

                    child: Swiper(
                      itemCount: bannerList == null ? 0 : bannerList.length,
                      autoplay: false,
                      itemBuilder: (BuildContext context, int index){
                        return GestureDetector(
                          onTap: (){

                          },
                          child: Image.network(
                            bannerList == null ? '' : bannerList[index].imgUrl,
                            fit: BoxFit.cover,
                            width: 315,
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset('assets/images/zhunxinche.png'),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              width: 210,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                                    hintText: "请输入你的手机号",
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xff999999), width: 0.5 )
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xff999999), width: 0.5)
                                    )
                                ),
                              ),
                            ),
                            Container(
                              height: 41,
                              width: 105,
                              child: RaisedButton(
                                elevation: 0,
                                color: Colors.red,
                                child: Text("免费咨询", style: TextStyle(color: Colors.white),),
                                onPressed: (){

                                },
                              ),
                            )
                          ],
                        )
                      ],
                    ),
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
                              child: Text('热门准新车车型', style: TextStyle(fontSize: 16, color: Color(0xff666666)),),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: Text('查看全部准新车', style: TextStyle(fontSize: 14, color: Color(0xff666666)),),
                            )
                          ],
                        ),
                        CarList(carList: carList)
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 90,
                        height: 30,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, '/citySelect').then((data){
                              setState(() {
                                city = data;
                                _loading = true;
                              });
                              _loadData();
                            });
                          },
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 50,
                                child: Text(city == null ? '厦门市' : city.name, style: TextStyle(fontSize: 16), maxLines: 1, overflow: TextOverflow.ellipsis,),
                              ),
                              Icon(Icons.keyboard_arrow_down, size: 26,)
                            ],
                          ),
                        ),
                      ),
                      Container(
                          width: 230,
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          margin: EdgeInsets.only(bottom: 0),
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
                      Container(

                        child: IconButton(
                            icon: Image.asset('assets/images/icon_tel1@2x.png',width: 24, height: 24),
                            highlightColor: Colors.black,
                            splashColor: Colors.red,
                            onPressed: (){
                            }
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Null> _loadData() async {
    try{
      var model = await new CommonRequest(
        param: {
          'cityCode': city == null ? '110100' : city.code,
          'type': 4
        },
        url: 'action/cms/app/mobileBannerImg',
        method: 'post'
      ).fetch();
      var model2 = await new CommonRequest(
          param: {
            'cityCode': city == null ? '110100' : city.code,
          },
          url: 'action/trade/app/tradeGetHotModel',
          method: 'post'
      ).fetch();

      setState((){
        bannerList = ZhunBannerModel.fromJson(model).data.list;
        carList = TradOldModel.fromJson(model2).data.list;
        print(carList);
        _loading = false;
      });

    }catch(e){
      _loading = false;
      print(e);
    }

  }
}