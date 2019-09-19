class CityListModel {
  int status;
  String msg;
  Data data;

  CityListModel({this.status, this.msg, this.data});

  CityListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<AllCitys> allCitys;
  List<HotCitys> hotCitys;
  int timestamp;

  Data({this.allCitys, this.hotCitys, this.timestamp});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['allCitys'] != null) {
      allCitys = new List<AllCitys>();
      json['allCitys'].forEach((v) {
        allCitys.add(new AllCitys.fromJson(v));
      });
    }
    if (json['hotCitys'] != null) {
      hotCitys = new List<HotCitys>();
      json['hotCitys'].forEach((v) {
        hotCitys.add(new HotCitys.fromJson(v));
      });
    }
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allCitys != null) {
      data['allCitys'] = this.allCitys.map((v) => v.toJson()).toList();
    }
    if (this.hotCitys != null) {
      data['hotCitys'] = this.hotCitys.map((v) => v.toJson()).toList();
    }
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class AllCitys {
  String cityId;
  String cityIndex;
  String cityName;
  String code;
  String enName;
  String showCityName;

  AllCitys(
      {this.cityId,
        this.cityIndex,
        this.cityName,
        this.code,
        this.enName,
        this.showCityName});

  AllCitys.fromJson(Map<String, dynamic> json) {
    cityId = json['cityId'];
    cityIndex = json['cityIndex'];
    cityName = json['cityName'];
    code = json['code'];
    enName = json['enName'];
    showCityName = json['showCityName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cityId'] = this.cityId;
    data['cityIndex'] = this.cityIndex;
    data['cityName'] = this.cityName;
    data['code'] = this.code;
    data['enName'] = this.enName;
    data['showCityName'] = this.showCityName;
    return data;
  }
}

class HotCitys {
  String cityId;
  String cityIndex;
  String cityName;
  String code;
  String enName;
  String showCityName;

  HotCitys(
      {this.cityId,
        this.cityIndex,
        this.cityName,
        this.code,
        this.enName,
        this.showCityName});

  HotCitys.fromJson(Map<String, dynamic> json) {
    cityId = json['cityId'];
    cityIndex = json['cityIndex'];
    cityName = json['cityName'];
    code = json['code'];
    enName = json['enName'];
    showCityName = json['showCityName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cityId'] = this.cityId;
    data['cityIndex'] = this.cityIndex;
    data['cityName'] = this.cityName;
    data['code'] = this.code;
    data['enName'] = this.enName;
    data['showCityName'] = this.showCityName;
    return data;
  }
}
