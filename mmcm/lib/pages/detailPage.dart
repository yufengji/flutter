import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mmcm/dao/home_dao.dart';
import 'package:mmcm/model/detail/detail_model.dart';
import 'package:mmcm/widget/detail/scheme.dart';
import 'package:mmcm/widget/loading_container.dart';
const APPBAR_SCROLL_OFFSET = 220;

class DetailPage extends StatefulWidget {
  Map arguments;
  DetailPage({Key key, this.arguments}) : super(key: key);
  @override
  _DetailPageState createState() => _DetailPageState(arguments: this.arguments);
}

class _DetailPageState extends State<DetailPage> {
  Map arguments;
  _DetailPageState({this.arguments});

  bool _loading = true;
  double appBarAlpha = 0;
  List<ImgDeatilList> imgDeatilList;
  FinancialPlan financialPlan;
  VehicleDetail vehicleDetail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: ListView(
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 240,
                              child: Swiper(
                                itemCount: imgDeatilList == null ? 0 : imgDeatilList.length,
                                autoplay: false,
                                itemBuilder: (BuildContext context, int index){
                                  return GestureDetector(
                                    onTap: (){

                                    },
                                    child: Image.network(
                                      imgDeatilList == null ? '' : imgDeatilList[index].imgPath,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                                pagination: imgDeatilList == null ? null : imgDeatilList.length == 1 ? null : SwiperPagination(),
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.fromLTRB(8, 3, 8, 3),
                                            margin: EdgeInsets.only(right: 15),
                                            color: Colors.red,
                                            child: Text('新车', style: TextStyle(fontSize: 16, color: Colors.white),),
                                          ),
                                          Text(vehicleDetail == null ? '' : vehicleDetail.brandName + ' ' + vehicleDetail.seriesName, style: TextStyle(fontSize: 22),)
                                        ],
                                      ),
                                      Text('厂商指导价 '+ (vehicleDetail == null ? '' : vehicleDetail.guidedPrice) +' 万元', style: TextStyle(fontSize: 16,color: Color(0xff999999)),),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(vehicleDetail == null ? '' : vehicleDetail.modelName, style: TextStyle(fontSize: 18),),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              margin: EdgeInsets.only(top: 15),
                              child: Scheme(financialPlan: financialPlan),
                            ),
                            Container(
                              color: Colors.white,
                              margin: EdgeInsets.only(top: 15),
                              padding: EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('可提车城市', style: TextStyle(fontSize: 16)),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Text(vehicleDetail == null ? '' : vehicleDetail.deptName, style: TextStyle(fontSize: 16),),
                                        Icon(Icons.keyboard_arrow_right)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              margin: EdgeInsets.only(top: 15),
                              padding: EdgeInsets.all(20),
                              child: Image.asset('assets/images/compare.jpg', fit: BoxFit.fill,),
                            )
                          ],
                        ),
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
                decoration: BoxDecoration(color: Colors.white),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 43,
                      left: 0,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.keyboard_arrow_left, size: 30),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 35),
                        child: Text('车辆详情页', style: TextStyle(fontSize: 16),),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _loadData() async {
    try{
      var model = await new CommonRequest(
        url: 'action/vehicle/detail/query',
        method: 'get',
        param: {
          'deptPublishId': arguments['id'],
          'clientId': 'dae116f4-12d6-49e4-b238-850046adf9e0'
        }
      ).fetch();
      setState((){
        imgDeatilList = DetailModel.fromJson(model).data.imgDeatilList;
        financialPlan = DetailModel.fromJson(model).data.financialPlan;
        vehicleDetail = DetailModel.fromJson(model).data.vehicleDetail;
        _loading = false;
      });

    }catch(e){
      _loading = false;
      print(e);
    }
  }
  void _onScroll(double pixels) {
    double alpha = pixels / APPBAR_SCROLL_OFFSET;
    if(alpha < 0){
      alpha = 0;
    }else if(alpha > 1){
      alpha = 1;
    }
    setState(() {
      this.appBarAlpha = alpha;
    });
  }
}
