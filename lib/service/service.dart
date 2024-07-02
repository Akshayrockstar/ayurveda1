import 'dart:convert';

import 'package:ayurvedas/core/shared_Prefe.dart';
import 'package:ayurvedas/model/login_response_model.dart';
import 'package:ayurvedas/model/patiant_list_model.dart';
import 'package:ayurvedas/service/app_url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Webservice {
  Future<Map<String, dynamic>> login(String username, String password) async {
    final dio = Dio();
    Map<String, dynamic> valueMap = Map();
    final baseUrl = 'http://flutter-amr.noviindus.in/api/';
    final loginUrl = Uri.parse('https://flutter-amr.noviindus.in/api/Login');

    try {
      final request = http.MultipartRequest('POST', loginUrl);
      request.fields['username'] = username;
      request.fields['password'] = password;

      // Add file as MultipartFile

      // Send request and get response
      final response = await request.send();
      final responseStream =
          Stream.fromIterable(await response.stream.toList());
      final responseBody = await responseStream.transform(utf8.decoder).join();

      valueMap = jsonDecode(responseBody);
      LoginResponse authUser = LoginResponse.fromJson(valueMap);
      print(valueMap);
      return {
        'status': true,
        'message': 'Success',
        'user': authUser,
      };
      print(response);
    } catch (e) {
      // Handle network or other errors
      print('Error: $e');
      return {
        'status': false,
        'message': 'Failed to connect to the server. Please try again later.',
        'user': null,
      };
    }
  }

  Future<List<Patient>> getPatiantList() async {
    var result;
    List<Patient> lis1t = [];
    String url = "${AppUrl.baseUrl}PatientList";
    String token = "";
    await UserPreferences().getUser().then(
      (user) {
        token = user.token ?? "";
        // print("Session Password :" +user.lastname.toString());
      },
    );

    // final Map<String, dynamic> loginData = {
    //
    //
    //   'username': username,
    //   'password': password
    // };
    final response = await http.get(
      Uri.parse(
        url,
      ),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print("response.statusCode");
    print(response.statusCode);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      var userData = responseData;

      print(userData["patient"]);
      (userData["patient"] as List).forEach((element) {
        lis1t.add(Patient.fromJson(element));
      });

      PatiantListModel patiantModel = PatiantListModel.fromJson(userData);

      //UserPreferences().saveUser(authUser);
      result = {
        'status': true,
        'message': patiantModel.message,
        'data': patiantModel
      };
    } else {
      //_loggedInStatus = Status.NotLoggedIn;
      //notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return lis1t;
  }

  Future<Map<String, dynamic>> register(
      {required name,
      required String excecutive,
      required String payment,
      required String phone,
      required String address,
      required double total_amount,
      required double discount_amount,
      required double useadvance_amountrname,
      required double balance_amount,
      required String date_nd_time,
      required String id,
      required int branch,
      required List<int> male,
      required List<int> treatment,
      required List<int> female}) async {
    String token = "";
    await UserPreferences().getUser().then(
      (user) {
        token = user.token ?? "";
        // print("Session Password :" +user.lastname.toString());
      },
    );
    var request = http.MultipartRequest(
      "POST",
      Uri.parse("${AppUrl.baseUrl}PatientUpdate"),
    );
    request.headers['Authorization'] = "$token";
    //var request = http.MultipartRequest("POST", Uri.parse("http://192.168.136.62:8080/dr_thayyari/dr_reg_withimage"));

    request.fields['name'] = name;
    request.fields['excecutive'] = excecutive;
    request.fields['payment'] = payment;
    request.fields['phone'] = phone;
    request.fields['address'] = address;
    request.fields['total_amount'] = total_amount.toString();
    request.fields['discount_amount'] = discount_amount.toString();
    request.fields['advance_amount'] = useadvance_amountrname.toString();
    request.fields['balance_amount'] = balance_amount.toString();
    request.fields['date_nd_time'] = date_nd_time;
    request.fields['id'] = id;
    request.fields['male'] = male.join(",");
    request.fields['female'] = female.join(",");
    request.fields['treatments'] = treatment.join(",");
    request.fields['branch'] = branch.toString();
    var response = await request.send();

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);

    Map<String, dynamic> result;
    print("responseStringresponseString$responseString");

/*
    final Map<String, dynamic> registerData = {
      'name':name,
      'date': date,
      'location': location,
      'selectedReportList': selectedReportList,
      'selectedReportList1': selectedReportList1,
      'education': education,
      'university': university,
      'username': username,
      'password': password,
      //'studentid': studentid,
    };

    //final url = "http://www.omdbapi.com/?s=$keyword&apikey=8c511351-372a-4752-91ce-79a9cc961aa2";
    final url="http://192.168.0.3:8080/dr_thayyari/dr_reg_withimage";
    final response = await http.post(Uri.parse(url
    ),

      body: registerData,
      //headers: {'Content-Type': 'application/json'}

    );*/
    if (response.statusCode == 200) {
      //print("response      :"+response.body.toString());

      /* final Map<String, dynamic> responseData =jsonDecode(responseString);
      var userData = responseData;

      print("userdata"+userData.toString());

      reg authUser = reg.fromJson(userData);*/
      result = {
        'status': true,
        'message': 'Successful',
        'user': responseString
      };
    } else {
      result = {'status': false, 'message': "error"};
    }
    return result;
  }
}
