class AuthModel {
  bool success;
  int status;
  DataBean data;
  ErrorBean error;

  AuthModel({this.success, this.status, this.data, this.error});

  AuthModel.fromJson(Map<String, dynamic> json) {
    this.success = json['success'];
    this.status = json['status'];
    this.data = json['data'] != null ? DataBean.fromJson(json['data']) : null;
    this.error = json['error'] != null ? ErrorBean.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    if (this.error != null) {
      data['error'] = this.error.toJson();
    }
    return data;
  }

}

class DataBean {
  String token;
  String message;
  UserBean user;

  DataBean({this.token, this.message, this.user});

  DataBean.fromJson(Map<String, dynamic> json) {
    this.token = json['token'];
    this.message = json['message'];
    this.user = json['user'] != null ? UserBean.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class ErrorBean {
  String message;
  var code;
  ErrorDetailsBean errorDetails;

  ErrorBean({this.message, this.code, this.errorDetails});

  ErrorBean.fromJson(Map<String, dynamic> json) {
   // print(json['error_details'] != null);
    this.message = json['message'];
    print(json['error_details'] != null && json['error_details'][0] != null && json['error_details'][0].length != 0);
    this.code = json['code'];
    this.errorDetails = (json['error_details'] != null && json['error_details'][0] != null && json['error_details'][0].length != 0) ? ErrorDetailsBean.fromJson(json['error_details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.errorDetails != null) {
      data['error_details'] = this.errorDetails.toJson();
    }
    return data;
  }
}

class ErrorDetailsBean {
  List<String> password;

  ErrorDetailsBean({this.password});

  ErrorDetailsBean.fromJson(Map<String, dynamic> json) {

    List<dynamic> passwordList = json['password'];
    this.password = new List();
    this.password.addAll(passwordList.map((o) => o.toString()));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    return data;
  }
}

class UserBean {
  String email;
  String firstName;
  String lastName;
  String name;
  String gender;
  String dateOfBirth;
  String phone;
  int id;
  int status;
  GroupBean group;

  UserBean({this.email, this.firstName, this.lastName, this.name, this.gender, this.dateOfBirth, this.phone, this.id, this.status, this.group});

  UserBean.fromJson(Map<String, dynamic> json) {
    this.email = json['email'];
    this.firstName = json['first_name'];
    this.lastName = json['last_name'];
    this.name = json['name'];
    this.gender = json['gender'];
    this.dateOfBirth = json['date_of_birth'];
    this.phone = json['phone'];
    this.id = json['id'];
    this.status = json['status'];
    this.group = json['group'] != null ? GroupBean.fromJson(json['group']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['phone'] = this.phone;
    data['id'] = this.id;
    data['status'] = this.status;
    if (this.group != null) {
      data['group'] = this.group.toJson();
    }
    return data;
  }
}

class GroupBean {
  String name;
  String createdAt;
  String updatedAt;
  int id;

  GroupBean({this.name, this.createdAt, this.updatedAt, this.id});

  GroupBean.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.createdAt = json['created_at'];
    this.updatedAt = json['updated_at'];
    this.id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['id'] = this.id;
    return data;
  }
}
