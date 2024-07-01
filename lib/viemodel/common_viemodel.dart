import 'package:ayurvedas/service/service.dart';
import 'package:flutter/material.dart';

class CommonViewModel extends ChangeNotifier {
  Future<Map<String, dynamic>> login(String username, String password) async {
    print(username);
    //   _loggedInStatus = Status.Authenticating;

    // if (username == null) {
    //   return {'status': false, 'message': 'fail', 'user': null};
    // }
    // if (username.isEmpty) {
    //   return {'status': false, 'message': 'fail', 'user': null};
    // }
    final results = await Webservice().login(username, password);

    return results;
    // notifyListeners();
  }
}
