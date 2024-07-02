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
    final results = await Webservice().register(
        address: address,
        balance_amount: balance_amount,
        branch: branch,
        date_nd_time: date_nd_time,
        discount_amount: discount_amount,
        excecutive: excecutive,
        female: female,
        id: id,
        male: male,
        name: name,
        payment: payment,
        phone: phone,
        total_amount: total_amount,
        treatment: treatment,
        useadvance_amountrname: useadvance_amountrname);

    return results;
  }
}
