import 'package:ayurvedas/screens/login/login_scrre.dart';
import 'package:ayurvedas/viemodel/common_viemodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(ChangeNotifierProvider<CommonViewModel>(
      create: (context) => CommonViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      )));
}
