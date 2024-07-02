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
    print("sssssssssssssssssssss$token");
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
}
