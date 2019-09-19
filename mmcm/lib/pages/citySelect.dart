import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:mmcm/dao/home_dao.dart';
import 'package:mmcm/model/home/city_list_model.dart';
import 'package:mmcm/model/city_model.dart';
import 'package:mmcm/widget/loading_container.dart';

class CitySelect extends StatefulWidget {
  @override
  _CitySelectState createState() => _CitySelectState();
}

class _CitySelectState extends State<CitySelect> {
  List list;
  List<CityInfo> _cityList = List();
  String _suspensionTag = 'A';
  int _suspensionHeight = 40;
  int _itemHeight = 50;
  bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    _loadData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("选择城市"),
      ),
      body: LoadingContainer(
        isLoading: _loading,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              height: 50.0,
              child: Text("当前城市: 成都市"),
            ),
            Expanded(
                flex: 1,
                child: AzListView(
                  data: _cityList,
                  itemBuilder: (context, model) => _buildListItem(model),
                  suspensionWidget: _buildSusWidget(_suspensionTag),
                  isUseRealIndex: true,
                  itemHeight: _itemHeight,
                  suspensionHeight: _suspensionHeight,
                  onSusTagChanged: _onSusTagChanged,
                  //showCenterTip: false,
                )
            ),
          ],
        ),
      ),
    );
  }

  void _loadData() async{
    try{
      var model = await new CommonRequest(
        url: 'action/base/app/cityList',
        method: 'get'
      ).fetch();
      if(CityListModel.fromJson(model).status == 1) {
        list = CityListModel.fromJson(model).data.allCitys;
        list.forEach((value){
          _cityList.add(CityInfo(name: value.cityName, namePinyin: value.enName, tagIndex: value.cityIndex, code: value.code));
        });
        SuspensionUtil.sortListBySuspensionTag(_cityList);
        setState(() {
          _loading = false;
        });
      }
    }catch(e){
      setState(() {
        _loading = false;
      });
      print(e);
    }
  }
  void _onSusTagChanged(String tag) {
    setState(() {
      _suspensionTag = tag;
    });
  }
  Widget _buildSusWidget(String susTag){
    return Container(
      height: _suspensionHeight.toDouble(),
      padding: const EdgeInsets.only(left: 15.0),
      color: Color(0xfff3f4f5),
      alignment: Alignment.centerLeft,
      child: Text(
        '$susTag',
        softWrap: false,
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xff999999),
        ),
      ),
    );
  }
  Widget _buildListItem(CityInfo model) {
    String susTag = model.getSuspensionTag();

    return Column(
      children: <Widget>[
        Offstage(
          offstage: model.isShowSuspension != true,
          child: _buildSusWidget(susTag),
        ),
        SizedBox(
          height: _itemHeight.toDouble(),
          child: ListTile(
            title: Text(model.name),
            onTap: () {
              Navigator.pop(context, model);
            },
          ),
        )
      ],
    );
  }
}
