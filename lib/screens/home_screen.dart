import 'package:ayurvedas/core/shared_Prefe.dart';
import 'package:ayurvedas/screens/login/login_scrre.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future getvalidationData() async {
    String? token;
    UserPreferences userPref = UserPreferences();
    userPref.getUser().then((user) {
      setState(() {
        token = user?.token ?? "";
      });
      if (token != "") {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Booking()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginScreen(),
    );
  }
}
