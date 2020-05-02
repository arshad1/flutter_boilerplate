import 'dart:convert';
import 'dart:math';

import 'package:flutterappredux/models/login/auth_model.dart';
import 'package:flutterappredux/repository/contract/auth_contract.dart';
import 'package:flutterappredux/services/api-service.dart';
import 'package:flutterappredux/services/http_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FakeAuthRepository extends AuthContract {
  static HttpHelper _http = HttpHelper();

  @override
  Future<AuthModel> checkAuth() async {
    await Future.delayed(Duration(seconds: 1));
    var response = {
      "status": 401,
      "success": false,
      "error": {
        "code": "error_401",
        "message": "Unauthenticated.",
        "error_details": []
      }
    };
/*    var response = {
      "status": 200,
      "success": true,
      "data": {
        "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMFwvYXBpXC92MlwvY3VzdG9tZXJcL2xvZ2luIiwiaWF0IjoxNTg2MjM4NzI5LCJleHAiOjE1ODYyNDIzMjksIm5iZiI6MTU4NjIzODcyOSwianRpIjoiNDdTNWU2UVFsZDNCaEhsdyIsInN1YiI6MSwicHJ2IjoiYTk4ZjRjOTY3NmZkYjFiM2FlZmUwOWUwZjE4ZTQ3NTc1NjYxNDE1MyJ9.W-0UbSxVsZ3yaL-3LGRRk9TgyYUSWxV31ymsphSvGEM",
        "message": "Logged in successfully.",
        "user": {
          "id": 1,
          "email": "arshadkm@gmail.com",
          "first_name": "Arshad",
          "last_name": "KM",
          "name": "Arshad KM",
          "gender": null,
          "date_of_birth": null,
          "phone": "9995073302",
          "status": 1,
          "group": {
            "id": 2,
            "name": "General",
            "created_at": null,
            "updated_at": null
          }
        }
      }
    }*/
    ;

    AuthModel _authData = AuthModel.fromJson(response);

    return _authData;
  }

  @override
  Future<AuthModel> Login(email, password) async {
    await Future.delayed(Duration(seconds: 1));
    var response;
    print(email);
    print(password);
    if (email == 'arshad@centresource.in' && password == 'admin123') {
      response = {
        "status": 200,
        "success": true,
        "data": {
          "token":
              "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMFwvYXBpXC92MlwvY3VzdG9tZXJcL2xvZ2luIiwiaWF0IjoxNTg2MjM4NzI5LCJleHAiOjE1ODYyNDIzMjksIm5iZiI6MTU4NjIzODcyOSwianRpIjoiNDdTNWU2UVFsZDNCaEhsdyIsInN1YiI6MSwicHJ2IjoiYTk4ZjRjOTY3NmZkYjFiM2FlZmUwOWUwZjE4ZTQ3NTc1NjYxNDE1MyJ9.W-0UbSxVsZ3yaL-3LGRRk9TgyYUSWxV31ymsphSvGEM",
          "message": "Logged in successfully.",
          "user": {
            "id": 1,
            "email": "arshadkm@gmail.com",
            "first_name": "Arshad",
            "last_name": "KM",
            "name": "Arshad KM",
            "gender": null,
            "date_of_birth": null,
            "phone": "9995073302",
            "status": 1,
            "group": {
              "id": 2,
              "name": "General",
              "created_at": null,
              "updated_at": null
            }
          }
        }
      };
    } else {
      var responseList = [
        {
          "status": 401,
          "success": false,
          "error": {
            "code": "auth_error",
            "message": "Invalid Email or Password",
            "error_details": []
          }
        },
        {
          "status": 422,
          "success": false,
          "error": {
            "code": "error_422",
            "message": "Validation error",
            "error_details": [
              {
                "email": ["Email is required!"],
                "password": ["Password is required!"]
              }
            ]
          }
        }
      ];
      final _random = new Random();
      response = responseList[_random.nextInt(responseList.length)];
    }
    AuthModel _authData = AuthModel.fromJson(response);
    return _authData;
  }
}
