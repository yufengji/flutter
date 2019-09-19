class DetailModel {
  int status;
  String msg;
  Data data;

  DetailModel({this.status, this.msg, this.data});

  DetailModel.fromJson(Map<String, dynamic> json) {
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
  FinancialPlan financialPlan;
  List<ImgDeatilList> imgDeatilList;
  List<ModelHighlightList> modelHighlightList;
  VehicleDetail vehicleDetail;

  Data(
      {this.financialPlan,
        this.imgDeatilList,
        this.modelHighlightList,
        this.vehicleDetail});

  Data.fromJson(Map<String, dynamic> json) {
    financialPlan = json['financialPlan'] != null
        ? new FinancialPlan.fromJson(json['financialPlan'])
        : null;
    if (json['imgDeatilList'] != null) {
      imgDeatilList = new List<ImgDeatilList>();
      json['imgDeatilList'].forEach((v) {
        imgDeatilList.add(new ImgDeatilList.fromJson(v));
      });
    }
    if (json['modelHighlightList'] != null) {
      modelHighlightList = new List<ModelHighlightList>();
      json['modelHighlightList'].forEach((v) {
        modelHighlightList.add(new ModelHighlightList.fromJson(v));
      });
    }
    vehicleDetail = json['vehicleDetail'] != null
        ? new VehicleDetail.fromJson(json['vehicleDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.financialPlan != null) {
      data['financialPlan'] = this.financialPlan.toJson();
    }
    if (this.imgDeatilList != null) {
      data['imgDeatilList'] =
          this.imgDeatilList.map((v) => v.toJson()).toList();
    }
    if (this.modelHighlightList != null) {
      data['modelHighlightList'] =
          this.modelHighlightList.map((v) => v.toJson()).toList();
    }
    if (this.vehicleDetail != null) {
      data['vehicleDetail'] = this.vehicleDetail.toJson();
    }
    return data;
  }
}

class FinancialPlan {
  var finalPayments;
  var rentDownPaymentAmtMax;
  var rentDownPaymentAmtMin;
  var rentExtensionTermNumber;
  var rentExtensionTermRepaymentAmt;
  var rentTermNumber;
  var rentTermRepaymentAmt;
  var stagesDownPaymentAmtMax;
  var stagesDownPaymentAmtMin;
  var stagesTermNumber;
  var stagesTermRepaymentAmt;

  FinancialPlan(
      {this.finalPayments,
        this.rentDownPaymentAmtMax,
        this.rentDownPaymentAmtMin,
        this.rentExtensionTermNumber,
        this.rentExtensionTermRepaymentAmt,
        this.rentTermNumber,
        this.rentTermRepaymentAmt,
        this.stagesDownPaymentAmtMax,
        this.stagesDownPaymentAmtMin,
        this.stagesTermNumber,
        this.stagesTermRepaymentAmt});

  FinancialPlan.fromJson(Map<String, dynamic> json) {
    finalPayments = json['finalPayments'];
    rentDownPaymentAmtMax = json['rentDownPaymentAmtMax'];
    rentDownPaymentAmtMin = json['rentDownPaymentAmtMin'];
    rentExtensionTermNumber = json['rentExtensionTermNumber'];
    rentExtensionTermRepaymentAmt = json['rentExtensionTermRepaymentAmt'];
    rentTermNumber = json['rentTermNumber'];
    rentTermRepaymentAmt = json['rentTermRepaymentAmt'];
    stagesDownPaymentAmtMax = json['stagesDownPaymentAmtMax'];
    stagesDownPaymentAmtMin = json['stagesDownPaymentAmtMin'];
    stagesTermNumber = json['stagesTermNumber'];
    stagesTermRepaymentAmt = json['stagesTermRepaymentAmt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['finalPayments'] = this.finalPayments;
    data['rentDownPaymentAmtMax'] = this.rentDownPaymentAmtMax;
    data['rentDownPaymentAmtMin'] = this.rentDownPaymentAmtMin;
    data['rentExtensionTermNumber'] = this.rentExtensionTermNumber;
    data['rentExtensionTermRepaymentAmt'] = this.rentExtensionTermRepaymentAmt;
    data['rentTermNumber'] = this.rentTermNumber;
    data['rentTermRepaymentAmt'] = this.rentTermRepaymentAmt;
    data['stagesDownPaymentAmtMax'] = this.stagesDownPaymentAmtMax;
    data['stagesDownPaymentAmtMin'] = this.stagesDownPaymentAmtMin;
    data['stagesTermNumber'] = this.stagesTermNumber;
    data['stagesTermRepaymentAmt'] = this.stagesTermRepaymentAmt;
    return data;
  }
}

class ImgDeatilList {
  int id;
  String imgDesc;
  int imgOrder;
  String imgPath;
  String imgTitle;

  ImgDeatilList(
      {this.id, this.imgDesc, this.imgOrder, this.imgPath, this.imgTitle});

  ImgDeatilList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgDesc = json['imgDesc'];
    imgOrder = json['imgOrder'];
    imgPath = json['imgPath'];
    imgTitle = json['imgTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imgDesc'] = this.imgDesc;
    data['imgOrder'] = this.imgOrder;
    data['imgPath'] = this.imgPath;
    data['imgTitle'] = this.imgTitle;
    return data;
  }
}

class ModelHighlightList {
  int id;
  String name;
  String url;

  ModelHighlightList({this.id, this.name, this.url});

  ModelHighlightList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class VehicleDetail {
  var brandId;
  String brandName;
  var deptId;
  String deptName;
  var finProductId;
  var finSchemeId;
  var firstMoneyLow;
  var firstRateLow;
  String guidedPrice;
  bool hadCollect;
  var id;
  bool isSupportStage;
  var liter;
  var modelHalfYear;
  var modelId;
  String modelName;
  var modelYear;
  var nature;
  bool newCar;
  var productLine;
  var rentDownPaymentAmtRate;
  var sellprice;
  String seriesEname;
  var seriesId;
  String seriesName;
  var stagesDownPaymentAmtRate;
  var status;
  var stockNum;
  String supportScheme;

  VehicleDetail(
      {this.brandId,
        this.brandName,
        this.deptId,
        this.deptName,
        this.finProductId,
        this.finSchemeId,
        this.firstMoneyLow,
        this.firstRateLow,
        this.guidedPrice,
        this.hadCollect,
        this.id,
        this.isSupportStage,
        this.liter,
        this.modelHalfYear,
        this.modelId,
        this.modelName,
        this.modelYear,
        this.nature,
        this.newCar,
        this.productLine,
        this.rentDownPaymentAmtRate,
        this.sellprice,
        this.seriesEname,
        this.seriesId,
        this.seriesName,
        this.stagesDownPaymentAmtRate,
        this.status,
        this.stockNum,
        this.supportScheme});

  VehicleDetail.fromJson(Map<String, dynamic> json) {
    brandId = json['brandId'];
    brandName = json['brandName'];
    deptId = json['dept_id'];
    deptName = json['dept_name'];
    finProductId = json['finProductId'];
    finSchemeId = json['finSchemeId'];
    firstMoneyLow = json['first_money_low'];
    firstRateLow = json['first_rate_low'];
    guidedPrice = json['guidedPrice'];
    hadCollect = json['hadCollect'];
    id = json['id'];
    isSupportStage = json['is_support_stage'];
    liter = json['liter'];
    modelHalfYear = json['modelHalfYear'];
    modelId = json['modelId'];
    modelName = json['modelName'];
    modelYear = json['modelYear'];
    nature = json['nature'];
    newCar = json['newCar'];
    productLine = json['productLine'];
    rentDownPaymentAmtRate = json['rentDownPaymentAmtRate'];
    sellprice = json['sellprice'];
    seriesEname = json['seriesEname'];
    seriesId = json['seriesId'];
    seriesName = json['seriesName'];
    stagesDownPaymentAmtRate = json['stagesDownPaymentAmtRate'];
    status = json['status'];
    stockNum = json['stockNum'];
    supportScheme = json['supportScheme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brandId'] = this.brandId;
    data['brandName'] = this.brandName;
    data['dept_id'] = this.deptId;
    data['dept_name'] = this.deptName;
    data['finProductId'] = this.finProductId;
    data['finSchemeId'] = this.finSchemeId;
    data['first_money_low'] = this.firstMoneyLow;
    data['first_rate_low'] = this.firstRateLow;
    data['guidedPrice'] = this.guidedPrice;
    data['hadCollect'] = this.hadCollect;
    data['id'] = this.id;
    data['is_support_stage'] = this.isSupportStage;
    data['liter'] = this.liter;
    data['modelHalfYear'] = this.modelHalfYear;
    data['modelId'] = this.modelId;
    data['modelName'] = this.modelName;
    data['modelYear'] = this.modelYear;
    data['nature'] = this.nature;
    data['newCar'] = this.newCar;
    data['productLine'] = this.productLine;
    data['rentDownPaymentAmtRate'] = this.rentDownPaymentAmtRate;
    data['sellprice'] = this.sellprice;
    data['seriesEname'] = this.seriesEname;
    data['seriesId'] = this.seriesId;
    data['seriesName'] = this.seriesName;
    data['stagesDownPaymentAmtRate'] = this.stagesDownPaymentAmtRate;
    data['status'] = this.status;
    data['stockNum'] = this.stockNum;
    data['supportScheme'] = this.supportScheme;
    return data;
  }
}
