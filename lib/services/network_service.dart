import 'dart:convert';

import 'package:http/http.dart';
import 'package:online_6_http/models/employee_model.dart';

import '../models/data_model.dart';

class NetworkService{

  static String BASE = "dummy.restapiexample.com";
  static Map<String, String> headers = {'Content-type': 'application/json; charset=UTF-8'};

  static String API_LIST = "/api/v1/employees";
  static String API_CREATE = "/api/v1/create";
  static String API_UPDATE = "/api/v1/update/"; //{id}
  static String API_DELETE = "/api/v1/delete/"; //{id}

  static Future<String?>GET(String api, Map<String, dynamic>params)async{
    var uri = Uri.https(BASE, api, params);
    var response = await get(uri, headers: headers);
    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }

  static Future<String?>POST(String api, Map<String, dynamic>params)async{
    var uri = Uri.https(BASE, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }
    return null;
  }

  static Future<String?>PUT(String api, Map<String, dynamic>params)async{
    var uri = Uri.https(BASE, api);
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }

  static Future<String?>DELETE(String api, Map<String, dynamic>params)async{
    var uri = Uri.https(BASE, api, params);
    var response = await delete(uri, headers: headers);
    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }

  static Map<String, dynamic>emptyParams(){
    Map<String, dynamic>params = {};
    return params;
  }

  static Map<String, dynamic>createParams(Data data){
    Map<String, dynamic>params = {};
    params.addAll({
      'employee_name' : data.employeeName,
      'employee_salary': data.employeeSalary.toString(),
      'employee_age' : data.employeeAge.toString(),
      'id' : data.id.toString(),
    });
    return params;
  }

  static Map<String, dynamic>updateParams(Data data){
    Map<String, dynamic>params = {};
    params.addAll({
      'employee_name' : data.employeeName,
      'employee_salary': data.employeeSalary.toString(),
      'employee_age' : data.employeeAge.toString(),
      'id' : data.id.toString(),
    });
    return params;
  }





}