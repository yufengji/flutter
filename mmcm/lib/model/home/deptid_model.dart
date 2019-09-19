class DeptIdModel {
  int status;
  String msg;
  DeptId data;

  DeptIdModel({this.status, this.msg, this.data});

  DeptIdModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new DeptId.fromJson(json['data']) : null;
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

class DeptId {
  int deptId;

  DeptId({this.deptId});

  DeptId.fromJson(Map<String, dynamic> json) {
    deptId = json['deptId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deptId'] = this.deptId;
    return data;
  }
}