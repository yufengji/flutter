class TradModel {
  int status;
  String msg;
  TradData data;

  TradModel({this.status, this.msg, this.data});

  TradModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new TradData.fromJson(json['data']) : null;
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

class TradData {
  List<HotVehicles> hotVehicles;
  List<LowVehicles> lowVehicles;

  TradData({this.hotVehicles, this.lowVehicles});

  TradData.fromJson(Map<String, dynamic> json) {
    if (json['hotVehicles'] != null) {
      hotVehicles = new List<HotVehicles>();
      json['hotVehicles'].forEach((v) {
        hotVehicles.add(new HotVehicles.fromJson(v));
      });
    }
    if (json['lowVehicles'] != null) {
      lowVehicles = new List<LowVehicles>();
      json['lowVehicles'].forEach((v) {
        lowVehicles.add(new LowVehicles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hotVehicles != null) {
      data['hotVehicles'] = this.hotVehicles.map((v) => v.toJson()).toList();
    }
    if (this.lowVehicles != null) {
      data['lowVehicles'] = this.lowVehicles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HotVehicles {
  String brandName;
  int id;
  String lowFirstMoney;
  String modelName;
  String monthMoney;
  String picUrl;
  String seriesName;
  bool zeroFirstPay;

  HotVehicles(
      {this.brandName,
        this.id,
        this.lowFirstMoney,
        this.modelName,
        this.monthMoney,
        this.picUrl,
        this.seriesName,
        this.zeroFirstPay});

  HotVehicles.fromJson(Map<String, dynamic> json) {
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

class LowVehicles {
  String brandName;
  int id;
  String lowFirstMoney;
  String modelName;
  String monthMoney;
  String picUrl;
  String seriesName;
  bool zeroFirstPay;

  LowVehicles(
      {this.brandName,
        this.id,
        this.lowFirstMoney,
        this.modelName,
        this.monthMoney,
        this.picUrl,
        this.seriesName,
        this.zeroFirstPay});

  LowVehicles.fromJson(Map<String, dynamic> json) {
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
