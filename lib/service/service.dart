import 'dart:convert';

import 'package:ayurvedas/model/login_response_model.dart';
import 'package:dio/dio.dart';
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
}
