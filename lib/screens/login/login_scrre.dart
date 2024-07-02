import 'package:ayurvedas/core/common/common_button.dart';

import 'package:ayurvedas/core/const.dart';
import 'package:ayurvedas/core/shared_Prefe.dart';
import 'package:ayurvedas/model/login_response_model.dart';
import 'package:ayurvedas/screens/booking_details/booking_details.dart';
import 'package:ayurvedas/viemodel/common_viemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../core/common/textform_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  CommonViewModel vm = CommonViewModel();
  @override
  Widget build(BuildContext context) {
    vm = Provider.of<CommonViewModel>(context);
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: height / 4,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("asset/login.png"))),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(margin),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Login or Register To Book Your Appontments",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InputField(
                    heading: "Email",
                    hint: "Enter your Email",
                    controller: email,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InputField(
                    heading: "Password",
                    hint: "Enter Password",
                    controller: password,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                    label: "Login",
                    onTap: () {
                      final Future<Map<String, dynamic>> successfulMessage =
                          vm.login(email.text, password.text);

                      successfulMessage.then((response) {
                        print("akkkkk :" + response.toString());
                        if (response['status']) {
                          print(response);
                          LoginResponse user = response['user'];
                          debugPrint("user.token${user.token}");

                          if (email.text == user.userDetails?.username &&
                              password.text == user.userDetails?.passwordText) {
                            if (user.userDetails?.username != '' &&
                                user.userDetails?.passwordText != '') {
                              UserPreferences().saveUser(user);
                              UserPreferences().getUser().then(
                                (user) {
                                  print("Session Username :${user.token}");
                                  // print("Session Password :" +user.lastname.toString());
                                },
                              );
                              // Flushbar(
                              //   title: "Success",
                              //   message:
                              //       response['message']['message'].toString(),
                              //   duration: Duration(seconds: 3),
                              // ).show(context);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BookingDetailScreen()));
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(response["message"] ?? ""),
                            ));
                          }
                        } else {
                          print("elsecase");
                        }
                      });
                    },
                  ),
                  const Spacer(),
                  Text(
                      "By creating or Logging in to an account You are agreeing with our terms and conditions and privacy and policy")
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
