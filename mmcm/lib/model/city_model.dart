import 'package:azlistview/azlistview.dart';

class CityInfo extends ISuspensionBean {
  String name;
  String tagIndex;
  String namePinyin;
  String code;

  CityInfo({
    this.name,
    this.tagIndex,
    this.namePinyin,
    this.code
  });

  CityInfo.fromJson(Map<String, dynamic> json)
      : name = json['name'] == null ? "" : json['name'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'tagIndex': tagIndex,
    'namePinyin': namePinyin,
    'isShowSuspension': isShowSuspension,
    'code': code
  };

  @override
  String getSuspensionTag() => tagIndex;

  // @override
  // String toString() => "CityBean {" + " \"name\":\"" + name + "\"" + '}';
}
