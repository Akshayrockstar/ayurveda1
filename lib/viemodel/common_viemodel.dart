import 'package:ayurvedas/model/patiant_list_model.dart';
import 'package:ayurvedas/service/service.dart';
import 'package:flutter/material.dart';

class CommonViewModel extends ChangeNotifier {
  Future<Map<String, dynamic>> login(String username, String password) async {
    final results = await Webservice().login(username, password);

    return results;
    notifyListeners();
  }

  Future<List<Patient>> getPatiantList() async {
    final results = await Webservice().getPatiantList();

    return results;
  }
}
