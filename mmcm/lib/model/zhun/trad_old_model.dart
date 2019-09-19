class TradOldModel {
  int status;
  String msg;
  Data data;

  TradOldModel({this.status, this.msg, this.data});

  TradOldModel.fromJson(Map<String, dynamic> json) {
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
  List<tradList> list;

  Data({this.list});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = new List<tradList>();
      json['list'].forEach((v) {
        list.add(new tradList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class tradList {
  String brandName;
  int id;
  String lowFirstMoney;
  String modelName;
  String monthMoney;
  String picUrl;
  String seriesName;
  bool zeroFirstPay;

  tradList(
      {this.brandName,
        this.id,
        this.lowFirstMoney,
        this.modelName,
        this.monthMoney,
        this.picUrl,
        this.seriesName,
        this.zeroFirstPay});

  tradList.fromJson(Map<String, dynamic> json) {
    brandName = json['brandName'];
    id = json['id'];
    lowFirstMoney = json['lowFirstMoney'];
    modelName = json['modelName'];
    monthMoney = json['monthMoney'];
    picUrl = json['picUrl'];
    seriesName = json['seriesName'];
    zeroFirstPay = json['zeroFirstPay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brandName'] = this.brandName;
    data['id'] = this.id;
    data['lowFirstMoney'] = this.lowFirstMoney;
    data['modelName'] = this.modelName;
    data['monthMoney'] = this.monthMoney;
    data['picUrl'] = this.picUrl;
    data['seriesName'] = this.seriesName;
    data['zeroFirstPay'] = this.zeroFirstPay;
    return data;
  }
}
