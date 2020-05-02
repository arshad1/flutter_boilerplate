class Test {
  bool success;
  int status;
  int authenticated;
  ErrorBean error;

  Test({this.success, this.status, this.authenticated, this.error});

  Test.fromJson(Map<String, dynamic> json) {    
    this.success = json['success'];
    this.status = json['status'];
    this.authenticated = json['authenticated'];
    this.error = json['error'] != null ? ErrorBean.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['authenticated'] = this.authenticated;
    if (this.error != null) {
      data['error'] = this.error.toJson();
    }
    return data;
  }

}

class ErrorBean {
  String message;
  String code;
  List<ErrorDetailsListBean> errorDetails;

  ErrorBean({this.message, this.code, this.errorDetails});

  ErrorBean.fromJson(Map<String, dynamic> json) {    
    this.message = json['message'];
    this.code = json['code'];
    this.errorDetails = (json['error_details'] as List)!=null?(json['error_details'] as List).map((i) => ErrorDetailsListBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['code'] = this.code;
    data['error_details'] = this.errorDetails != null?this.errorDetails.map((i) => i.toJson()).toList():null;
    return data;
  }
}

class ErrorDetailsListBean {
  List<String> email;
  List<String> password;

  ErrorDetailsListBean({this.email, this.password});

  ErrorDetailsListBean.fromJson(Map<String, dynamic> json) {    

    List<dynamic> emailList = json['email'];
    this.email = new List();
    this.email.addAll(emailList.map((o) => o.toString()));

    List<dynamic> passwordList = json['password'];
    this.password = new List();
    this.password.addAll(passwordList.map((o) => o.toString()));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
