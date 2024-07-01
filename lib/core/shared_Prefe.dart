import 'package:ayurvedas/model/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUser(LoginResponse user) async {
    print("prefs.getString(username) in Saving :");

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    //prefs.setInt("userId", user.userId);
    prefs.setString(
      'username',
      user.userDetails?.username ?? "",
    );
    prefs.setString(
      'token',
      user.token ?? "",
    );
    prefs.setBool("isLoggedIn", true);

    return prefs.commit();
  }

  Future<LoginResponse> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String username = prefs.getString("username") ?? "";
    String token = prefs.getString("token") ?? "";
    print("username" + username.toString());

    return LoginResponse(token: token);
  }
}
